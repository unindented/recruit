# Recruit [![Build Status](https://img.shields.io/travis/unindented/recruit.svg)](http://travis-ci.org/unindented/recruit) [![Dependency Status](https://img.shields.io/gemnasium/unindented/recruit.svg)](https://gemnasium.com/unindented/recruit) [![Coverage Status](https://img.shields.io/coveralls/unindented/recruit.svg)](https://coveralls.io/r/unindented/recruit) [![Quality Status](https://img.shields.io/codeclimate/github/unindented/recruit.svg)](https://codeclimate.com/github/unindented/recruit)

Simple CRUD app for collecting candidate information at job fairs.


## Installation

```sh
bundle install
```


## Running in development mode

```sh
bundle exec rake db:setup
rails server
```

By default, the following roles are created:

* Java Engineer
* Ruby on Rails Engineer
* JavaScript Engineer
* iOS / Android Engineer
* QA Test Engineer
* UX Designer
* UI Designer
* Product Manager

Also, a user with access to the administration panel is created:

* **Email**: unindented@gmail.com
* **Password**: changeme


## Running on Heroku

Heroku should take care of precompiling assets. If you need to do that manually, run:

```sh
RAILS_ENV=production bundle exec rake assets:precompile
```

Generate a secret token:

```sh
heroku config:set SECRET_TOKEN=`bundle exec rake secret`
```

Prepare the database:

```sh
heroku run bundle exec rake db:migrate db:seed
```

And you should be ready to go!


## Usage

Go to the root URL (e.g. <http://localhost:3000> if you are in development mode), and you will see the application form. Candidates must enter their name and email address, and optionally the role they are applying for and any comments they want to add. When they press the *Join us!* button, their data will be stored in the database.

![Home page](http://unindented.github.io/recruit/images/home.png)

If you now go to the administration URL (e.g. <http://localhost:3000/admin>) and enter your credentials, you will be able to access a dashboard with a list of all candidates that have registered, and export it to different formats.

![Admin page with a list of candidates](http://unindented.github.io/recruit/images/candidates.png)


## Meta

* Code: `git clone git://github.com/unindented/recruit.git`
* Home: <https://github.com/unindented/recruit/>


## Contributors

* Daniel Perez Alvarez ([unindented@gmail.com](mailto:unindented@gmail.com))


## License

Copyright (c) 2013 Daniel Perez Alvarez ([unindented.org](https://unindented.org/)). This is free software, and may be redistributed under the terms specified in the LICENSE file.
