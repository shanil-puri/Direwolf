#!/usr/bin/python
import json

with open("coverage.json") as json_file:
    json_data = json.load(json_file)
    coverage = json_data['metrics']['covered_percent']
    if int(coverage) < 80:
        print 0
        exit(0)
    print 1
    exit(1)
    
