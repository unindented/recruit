Rails.application.config.generators do |g|
  g.test_framework :rspec, fixture: true
  g.fixture_replacement :factory_girl

  g.helper       false
  g.assets       false
  g.view_specs   false
  g.helper_specs false
end
