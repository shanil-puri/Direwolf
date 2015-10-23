#!/bin/bash
CURDIR=`pwd`
echo $CURDIR

echo "Running Test"

docker -H 52.89.132.135:4243 run -v /home/ubuntu$CURDIR:/test/ mpancha/buildserver /bin/sh -c 'cd /test/;bundle config --global path /test/bin; bundle config --global bin /test/bin; bundle install; export PATH=$PATH:/test/bin; service mysql restart; rake db:create; rake db:migrate; bundle exec rspec spec/controllers/job_controller_spec.rb'

echo "Running Static Code Analysis using excellent gem"

docker -H 52.89.132.135:4243 run -v /home/ubuntu$CURDIR:/test/ mpancha/buildserver /bin/sh -c 'cd /test/;bundle config --global path /test/bin; bundle config --global bin /test/bin; bundle install; export PATH=$PATH:/test/bin; excellent /test/app /test/config /test/script'

