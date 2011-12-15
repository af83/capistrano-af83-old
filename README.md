Capistrano recipes for af83
===========================

We are [af83](http://dev.af83.com/). We develop web applications and most of
them are deployed with [capistrano](https://github.com/capistrano/capistrano).
The capistrano-af83 gem let us share recipes and good practices between our
projects. It's an Open-Source project, so feel free to use it or just look at
it for inspiration!


How to use it?
--------------

Add it in the `Gemfile` and run `bundle update`:

```ruby
group :development do
  gem 'capistrano-af83'  
end
```

Then use of one the
[examples](https://github.com/af83/capistrano-af83/blob/master/examples) of
`config/deploy.rb` files and follow the comments for configuration.

And finally test it on the dev environment:

```sh
cap dev deploy:setup
cap dev deploy:check
cap dev deploy
```


Capistrano extensions
---------------------

We use some capistrano extensions (capistrano-af83 depends on them):

- [**multistage**](https://github.com/TechnoGate/capistrano-exts):
  have a configuration per environment
- [**capistrano_colors**](https://github.com/stjernstrom/capistrano_colors/):
  colorize your capistrano output for better overview
- [**capistrano-notification**](https://github.com/ursm/capistrano-notification):
  notify the end of the deployment on IRC
- [**sushi**](https://github.com/presskey/sushi):
  add a recipe that starts a SSH connection to remote server
- [**bundler**](http://gembundler.com/deploying.html):
  automatically run bundle install on the remote server with deployment-friendly options


Environments
------------

    +-----------+-------------+------------+----------------------------+
    | Cap stage | Rails env   | Git branch | Host                       |
    +-----------+-------------+------------+----------------------------+
    | N/A       | development | master     | localhost                  |
    | N/A       | test        | master     | localhost/jenkins          |
    | dev       | dev         | master     | dev.{project}.af83.com     |
    | staging   | staging     | staging    | staging.{project}.af83.com |
    | prod      | production  | production | {project}.com              |
    +-----------+-------------+------------+----------------------------+


Credits
-------

Copyright (c) 2011 af83

Released under the MIT license
