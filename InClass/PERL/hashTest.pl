#!/usr/bin/perl
use strict;
use warnings;
use Test::Simple tests=>1;
require "hash.pl";

my %gradeTable = (
    Matt=>3.9,      # floating point
    Linda=>"0.2"    # string
);

ok( abs(classAverage(\%gradeTable) - 2.05) <= 0.01 );  # don't ever use == when comparing floating point numbers

# print "Matt's GPA is ";
# print $gradeTable{"Matt"} + 0.1; # $ because pulling out a scalar
# print "\n";
# print "Linda's GPA is ";
# print $gradeTable{"Linda"} + 2.0;

# my @names = keys \%gradeTable;
# print $names[0] . "\n";
# print $names[1] . "\n";
