# exercism.io
[![Build Status](https://travis-ci.org/exercism/exercism.io.png?branch=master)](https://travis-ci.org/exercism/exercism.io)
[![Code Climate](https://codeclimate.com/github/exercism/exercism.io.png)](https://codeclimate.com/github/exercism/exercism.io)
[![Gemnasium](https://gemnasium.com/exercism/exercism.io.png)](https://gemnasium.com/exercism/exercism.io)
[![Coverage Status](https://coveralls.io/repos/exercism/exercism.io/badge.png?branch=master)](https://coveralls.io/r/exercism/exercism.io?branch=master)

To get started using exercism.io to practice or provide feedback on other
people's code, check out the [getting
started](http://exercism.io/getting-started) page on the website.

## Contact Us

To report a bug, suggest improvements to exercism.io, or if you're having trouble
installing or using the CLI, please **[open a GitHub
issue](https://github.com/exercism/exercism.io/issues)**.

If you're having trouble writing the code to solve a problem, then your best
bet is [StackOverflow](http://stackoverflow.com/) (remember to tag the
question with #exercism). Another option is to submit the code even though it
doesn't pass the tests yet, and then go to your submission page to explain
where you're stuck.

We welcome questions, and will do our best to help you out!

Follow us on [twitter @exercism_io](https://twitter.com/exercism_io).

Jump in and chat with other exercism enthusiasts on the #exercism channel on irc.freenode.net.
It's not a very active channel, but we're a friendly bunch.

For occasional updates, such as new language tracks being launched,
[sign up for the newsletter](http://exercism.us9.list-manage.com/subscribe?u=c5ed2d182b80db686ffa4025a&id=cdcdca241e).

Exercism.io was started by Katrina. To get in touch with her, send an email to
[kytrinyx@exercism.io](mailto:kytrinyx@exercism.io).

## Contributing

We're working on improving the
[CONTRIBUTING.md](https://github.com/exercism/exercism.io/blob/master/CONTRIBUTING.md)
document, which will describe the various parts of the system and how they fit
together.

Exercism.io is free and open source, and many, many people have contributed to
the project by:

* Reporting, reproducing, or fixing bugs
* Triaging issues
* Suggesting, discussing, or implementing features
* Refactoring
* Improving the design of the site
* Adding tests
* Improving documentation
* Improving test suites for the language tracks
* Adding new problems to existing tracks
* Porting problems to new tracks
* Providing feedback on people's code
* Reviewing pull requests
* ... and more

This is a project that started by accident and could never have gotten off the
ground by the efforts of any single person.

**Thank you!**

## Setup

**TODOS for Vagrant + Docker**

1. Install [Vagrant](https://www.vagrantup.com/downloads) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads) to be able to run the samples.


<!--
At the moment the setup instructions are skewed heavily in favor of linux and
Mac OS X. This doesn't mean you can't develop on Windows, only that we don't
yet know how to get everything set up for Windows. We're hoping to address
that soon!

1. Install postgresql with: `brew install postgresql` or `apt-get install postgresql-9.2`
1. Copy `.ruby-version.example` to `.ruby-version` if you use a Ruby version manager such as RVM, rbenv or chruby
1. Install gems with: `bundle`
1. Install `mailcatcher` with `gem install mailcatcher`
1. Get a client id/secret from GitHub at https://github.com/settings/applications/new.
  * Name: whatever
  * URL: http://localhost:4567
  * Callback url: http://localhost:4567/github/callback
1. Presuming you have Postgres installed, run `rake db:setup`
1. Run the database migrations with `rake db:migrate`.
1. Fetch the seed data with `rake db:seeds:fetch`.
1. Run the database seed with `rake db:seed`.
1. Copy `config/env` to `.env`
1. Edit `.env` to fill in the correct values, including the GitHub client id/secret procured earlier.
1. Start the server with `foreman start`
1. Login at http://localhost:4567.
1. You can view the emails sent in [MailCatcher](http://mailcatcher.me/) in your browser at [localhost:1080](http://localhost:1080).
1. Work through 'Frontend development setup' below and run lineman for correct styling at http://localhost:4567
-->
## Frontend development setup
1. Install node and npm
  * osx: brew install node
  * others see: https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
2. Install lineman via `sudo npm install -g lineman`
3. `cd frontend` and start lineman with `lineman run`
  * note lineman watches for file changes and compiles them automatically, it is not required to be running for the server to run

### SCSS
1. Start compass with `compass watch`
2. to compile `compass compile`

For CSS we are using Sass (with `.scss`). Feel free to use [Bootstrap 3](http://getbootstrap.com/) components and mixins. Or if you want to use even more mixins you can use [Compass](http://compass-style.org/reference/compass/). Structurewise we try to separate components, mixins and layouts. Where layouts should be a single page (using an HTML id as a selector) and components should be reusable partials, which can look different by layout.

You can find the compass config in `lib/app/config.rb`.

### Styleguide

Our styleguide is reachable under [/styleguide](http://exercism.io/styleguide) and built with [KSS](https://github.com/kneath/kss), which enables you to write examples to `*.scss` files

## Sending Emails

If you want to send emails, you will need to fill out the relevant environment variables in `.env` and uncomment the lines so that the variables get exported.

## Console

There's a script in `bin/console` that will load pry with the exercism environment loaded.
This will let you poke around at the objects in the system, such as finding users and changing
things about submissions or comments, making it easier to test specific things.

```ruby
user = User.find_by_username 'whatever'
user.submissions
```

## Testing

1. Create test database with: `createdb -O exercism exercism_test`.
2. Prepare the test environment with `RACK_ENV=test rake db:migrate`.
3. Make sure that `mailcatcher` is running.
4. Run the test suite with `rake` or `rake test`.

To run a single test suite, you can do so with:

```bash
ruby path/to/the_test.rb
```

If it complains about dependencies, then either we forgot to require the correct dependencies (a distinct possibility), or we are dependening on a particular tag of a gem installed directly from github (this happens on occasion).

If there's a git dependency, you can do this:

```bash
bundle exec ruby path/to/the_test.rb
```

For the require, you'll need to figure out what the missing dependency is. Feel free to open an issue on github. It's likely that someone familiar with the codebase will be able to identify the problem immediately.

### Code coverage

To enable code coverage run:

```bash
COVERAGE=1 rake test
```

Browse the results located in `coverage/index.html`

## Deployment

Let Heroku know that Lineman will be building our assets. From the command line:
```
heroku config:set BUILDPACK_URL=https://github.com/testdouble/heroku-buildpack-lineman-ruby.git
```

## Contributing

Thank you for wanting to contribute! :heart::sparkling_heart::heart:

Fork and clone. Hack hack hack.
Submit a pull request and tell us why your idea is awesome.

For more details, please read the [contributing guide](https://github.com/exercism/exercism.io/blob/master/CONTRIBUTING.md).

To join the mailing list, send an email to exercism@librelist.com to be automatically subscribed or check out the [Archives](http://librelist.com/browser/exercism/).

## License

GNU Affero General Public License

Copyright (C) 2013 Katrina Owen, _@kytrinyx.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

