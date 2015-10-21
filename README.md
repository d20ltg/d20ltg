# d20 Legendary Tabletop Games

Store website and inventory tracking system

[![Build Status](https://travis-ci.org/d20ltg/d20ltg.svg)](https://travis-ci.org/d20ltg/d20ltg)

## Website Links

Site         | Link
------------ | --------------------
Live Website | http://d20gamers.com
Staging Site | http://d20ltg-staging.herokuapp.com

## Tools and Resources

Tool                   | Provider     | Link
---------------------- | ------------ | -----------------------
Scrum Management       | Acunote      | http://gold.acunote.com
Document Collaboration | Google Drive | https://drive.google.com/a/thecodesmith.com/folderview?id=0ByQksidROWkJT2NvR3FJRFlOTXc&usp=sharing
Source Code            | GitHub       | http://github.com/d20ltg/d20ltg
Web Hosting Dashboard  | Heroku       | https://dashboard.heroku.com/apps/d20ltg
Continuous Integration | TravisCI     | https://travis-ci.org/d20ltg/d20ltg

Resource               | Link
---------------------- | -----------------------
Rails Tutorial         | https://www.railstutorial.org/ (click "Read Online Free")
Heroku Ruby Intro      | https://devcenter.heroku.com/articles/getting-started-with-ruby
Heroku Rails Intro     | https://devcenter.heroku.com/articles/getting-started-with-rails4

## Development Environment Setup

### Ruby/Rails

These instructions are for Ruby/Rails on OS X. For other operating systems, see
the guide here: http://guides.railsgirls.com/install/.

#### rbenv

    brew update
    brew install rbenv rbenv-gem-rehash ruby-build
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> ~/.bash_profile
    source ~/.bash_profile

#### Ruby

    rbenv install 2.1.5
    rbenv global 2.1.5

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

## Branching Model

This project uses a typical git branching model, utilizing two main branches:

* dev
* master

Additionally, there can be any number of feature branches that are being
developed simultaneously. These must be branched off the `dev` branch.

The `master` branch represents production code, and must always be in a
deployable state. The `dev` branch is where development happens. The `dev`
branch on GitHub should be kept in a clean state with all tests passing, as a
courtesy to the other developers.

The workflow looks like this:

1) Start work on a new feature
2) Create a new feature branch off the `dev` branch, named after the feature
3) Do all development in this feature branch
4) Once the feature is complete, merge the branch back into the dev branch
5) Push the dev branch to github. This will trigger a build in TravisCI. If
the build passes all tests, the app will automatically be deployed to
http://d20ltg-staging.herokuapp.com.
6) Once everything in the staging environment has been validated, the app may
be deployed to production by merging the `dev` branch into the `master` branch

### Merging

To merge a branch in git, use this workflow:

    > git branch
      dev
    * master
      new_feature

    > git checkout dev
    > git merge new_feature

If there are any merge conflicts, use `git status` to view conflicted files.
Open each file and fix the merge conflicts, then save and use `git add` to mark
the file as fixed. Once all conflicts are fixed, use `git commit` to finish the
merge.

## Deployment

The `master` branch represents the production code. Heroku detects pushes to the
`master` branch and automatically deploys the new code, as long as the build
passes the continuous integration tests. If the TravisCI build is green, visit
http://d20gamers.com to view the deploy.

The `dev` branch will be automatically deployed to the staging site at
http://d20ltg-staging.herokuapp.com following a push to GitHub and a successful
build in TravisCI.
