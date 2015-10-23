#!/usr/bin/python
import subprocess
import json
print "EXTENDED ANALYSIS..."
analysis_data = subprocess.check_output(["/usr/bin/ruby", "-r", "./code_comment_percent.rb", "-e", "CodeCommentPercent.count_lines 'rb'"])
print analysis_data
print "ANALYSIS GATE..."
ana_cov = float(analysis_data.split('\n')[6])
if ana_cov < 5:
   print  ana_cov
   print "Analysis Gate FAILED"
   exit(1)
print ana_cov
print "Analysis Gate SUCCESS"
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


