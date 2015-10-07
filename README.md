# d20 Legendary Tabletop Games

Store website and inventory tracking system

[![Build Status](https://travis-ci.org/d20ltg/d20ltg.svg)](https://travis-ci.org/d20ltg/d20ltg)

## Tools and Resources

Tool                   | Provider     | Link
---------------------- | ------------ | -----------------------
Scrum Management       | Acunote      | http://gold.acunote.com
Document Collaboration | Google Drive | https://drive.google.com/a/thecodesmith.com/folderview?id=0ByQksidROWkJT2NvR3FJRFlOTXc&usp=sharing
Source Code            | GitHub       | http://github.com/d20ltg/d20ltg
Web Hosting Dashboard  | Heroku       | https://dashboard.heroku.com/apps/d20ltg
Live Website           | Heroku       | http://d20ltg.herokuapp.com (This will be updated with custom domain)


Resource               | Link
---------------------- | -----------------------
Rails Tutorial         | https://www.railstutorial.org/ (click "Read Online Free")
Heroku Ruby Intro      | https://devcenter.heroku.com/articles/getting-started-with-ruby
Heroku Rails Intro     | https://devcenter.heroku.com/articles/getting-started-with-rails4

## Development Environment Setup

### Ruby/Rails

These instructions are for Ruby/Rails on OS X. For other operating systems, see the guide here:
http://guides.railsgirls.com/install/.

#### rbenv

    brew update
    brew install rbenv rbenv-gem-rehash ruby-build
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> ~/.bash_profile
    source ~/.bash_profile

#### Ruby

    rbenv install 2.2.3
    rbenv global 2.2.3

#### Rails

    gem install rails --no-ri --no-doc

### Heroku

Reference: https://devcenter.heroku.com/articles/getting-started-with-ruby

#### Install Heroku Toolbelt

    gem install bundler
    brew install heroku

### Source Code

    git clone git@github.com:d20ltg/d20ltg
    cd d20ltg
    bundle install --without production

Note: PostgreSQL is not necessary to run locally during development if the
`--without production` flag is used with bundle install. PostgreSQL will be
used automatically in production on Heroku. Local databases will use the
default sqlite3.
