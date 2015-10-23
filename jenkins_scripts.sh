#!/bin/bash
echo "Running Static Code Analysis using excellent gem"
CURDIR=`pwd`
echo $CURDIR
docker -H 52.89.132.135:4243 run -v /home/ubuntu$CURDIR:/test/ mpancha/buildserver /bin/sh -c 'cd /test/;bundle config --global path /test/bin; bundle config --global bin /test/bin; bundle install; export PATH=$PATH:/test/bin; excellent /test/app /test/config /test/script'


#!/bin/bash
echo "Running Test"
CURDIR=`pwd`
echo $CURDIR
docker -H 52.89.132.135:4243 run -v /home/ubuntu$CURDIR:/test/ mpancha/buildserver /bin/sh -c 'cd /test/;bundle config --global path /test/bin; bundle config --global bin /test/bin; bundle install; export PATH=$PATH:/test/bin; service mysql restart; rake db:create; rake db:migrate; bundle exec rspec spec/controllers/job_controller_spec.rb'

#!/usr/bin/python

import json
print "TEST GATE..."
with open("coverage/coverage.json") as json_file:
    json_data = json.load(json_file)
    coverage = json_data['metrics']['covered_percent']
    if int(coverage) < 50:
        print coverage
        print "Test Gate FAILED"
        exit(1)
    print coverage
    print "Test Gate SUCCESS"
    exit(0)

