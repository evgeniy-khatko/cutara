# Cutara
This gem is a tool, which helps to automate WEB applications testing.
It converts [tarantula](https://github.com/evgeniy-khatko/tarantula) test cases to [cucumber](http://cukes.info) scenarios.
It has some set of predefined sentences similar to [frank](https://github.com/moredip/Frank) tool but in WEB domain.
It has WEB GUI.

## Usage

Preconditions
- Ruby installed
- gem install bundler
- Git installed
- Tarantula service is available through http://some/link

1. mkdir test; cd test
2. create file Gemfile with following content:

        gem 'rake'
        gem 'cutara', :git => 'https://github.com/evgeniy-khatko/cutara.git'

3. create file Rakefile with following content:
        require 'cutara/tasks'

4. bundle install
5. bundle exec rake cutara:gui
6. navigate to http://localhost:8000
7. refer to videos (http://qamind.ru/?page_id=436&lang=en)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
