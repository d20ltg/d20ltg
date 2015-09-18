# d20 Legendary Tabletop Games

Store website and inventory tracking system

## Resources

Resource               | Tool         | Link
Scrum Management       | Acunote      | http://gold.acunote.com
Document Collaboration | Google Drive | https://drive.google.com/a/thecodesmith.com/folderview?id=0ByQksidROWkJT2NvR3FJRFlOTXc&usp=sharing
Source Code            | GitHub       | http://github.com/d20ltg/d20ltg
Web Hosting Dashboard  | Heroku       | https://dashboard.heroku.com/apps/d20ltg
Live Website           | Heroku       | http://d20ltg.herokuapp.com (This will be updated with custom domain)

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

### Heroku (reference: https://devcenter.heroku.com/articles/getting-started-with-ruby)

    gem install bundler
    brew install heroku
