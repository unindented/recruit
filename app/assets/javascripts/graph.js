(function ($, d3, window, undefined) {

  'use strict';

  var COLORS = d3.scale.category10();

  // Helpers ///////////////////////////////////////////////////////////////////

  function filterRole(role) {
    return {
      type:    'role'
    , id:      'r' + role.id
    , role_id: role.id
    };
  }

  function filterCandidate(candidate) {
    return {
      type:    'candidate'
    , id:      'c' + candidate.id
    , role_id: candidate.role_id
    };
  }

  function buildFakeCandidate(id, role) {
    return {
      type:    'candidate'
    , id:      'f' + id
    , role_id: role
    };
  }

  function buildFakeCandidates(roles) {
    var candidates = []
      , i
      , j
      , l
      , m;

    Math.seedrandom(roles.length);

    for (i = 0, l = roles.length; i < l; i++) {
      for (j = 0, m = Math.floor(Math.random() * 4 + 2); j < m; j++) {
        candidates.push(buildFakeCandidate(candidates.length + 1, roles[i].role_id));
      }
    }

    return candidates;
  }

  // Graph /////////////////////////////////////////////////////////////////////

  function Graph(selector) {
    var $elem = $(selector);

    this.width  = $elem.width();
    this.height = $elem.height();
    this.radius = 15;

    this.nodes = [];
    this.links = [];

    this.force = d3.layout.force()
      .nodes(this.nodes)
      .links(this.links)
      .charge(-this.height * 2)
      .linkDistance(this.height / 10)
      .size([this.width, this.height])
      .on('tick', $.proxy(this.tick, this));

    var svg = d3.select(selector).append('svg')
        .attr('viewBox', '0 0 ' + this.width + ' ' + this.height);

    this.node = svg.selectAll('.node');
    this.link = svg.selectAll('.link');
  }

  Graph.prototype.start = function () {
    this.link = this.link.data(
      this.force.links(), function (d) { return d.source.id + '-' + d.target.id; }
    );
    this.link.enter().insert('line', '.node')
      .attr('class', 'link');
    this.link.exit()
      .remove();

    this.node = this.node.data(
      this.force.nodes(), function (d) { return d.id; }
    );
    this.node.enter().append('circle')
      .attr('class', 'node')
      .attr('r', this.radius - 0.75)
      .style('fill', function (d) { return COLORS(d.role_id); })
      .call(this.force.drag);
    this.node.exit()
      .remove();

    this.force.start();

    return this;
  };

  Graph.prototype.tick = function () {
    var w = this.width
      , h = this.height
      , r = this.radius;

    this.node
      .attr('cx', function (d) { return d.x = Math.max(r, Math.min(w - r, d.x)); })
      .attr('cy', function (d) { return d.y = Math.max(r, Math.min(h - r, d.y)); });

    this.link
      .attr('x1', function (d) { return d.source.x; })
      .attr('y1', function (d) { return d.source.y; })
      .attr('x2', function (d) { return d.target.x; })
      .attr('y2', function (d) { return d.target.y; });
  };

  Graph.prototype.addRoles = function (roles) {
    var links = []
      , i
      , l;

    // Filter out unwanted properties.
    roles = $.map(roles, filterRole);

    // Link all roles in a circle.
    for (i = 0, l = roles.length; i < l; i++) {
      links.push({ source: roles[i], target: roles[(i + 1) % l] });
    }
    this.nodes.push.apply(this.nodes, roles);
    this.links.push.apply(this.links, links);

    // Add some fake candidates to each role.
    this.addCandidates(buildFakeCandidates(roles));

    return this;
  };

  Graph.prototype.addCandidates = function (candidates) {
    $.each(candidates, $.proxy(function (index, candidate) {
      this.addCandidate(candidate);
    }, this));

    return this;
  };

  Graph.prototype.addCandidate = function (candidate) {
    // Filter out unwanted properties.
    candidate = filterCandidate(candidate);

    // Loop through all existing nodes...
    $.each(this.nodes, $.proxy(function (index, node) {
      // ... and if we find a role node that matches this candidate's...
      if (node.type === 'role' && node.role_id === candidate.role_id) {
        // ... we link them.
        this.nodes.push(candidate);
        this.links.push({ source: node, target: candidate });
      }
    }, this));

    return this;
  };

  window.Graph = Graph;

})(jQuery, d3, window);
