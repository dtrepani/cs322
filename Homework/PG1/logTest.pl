#!/usr/bin/perl
use strict;
use warnings;
use Test::Simple tests=>9;

require "log.pl";

my @log = (
	"src/ext/exThapi.c:993: warning: unused variable ‘nilOop’",
	"src/ext/exThapi.c:1193: warning: unused variable ‘soopTable’",
	"src/ext/exThapi.c:1250: warning: unused variable ‘poopTable’"
);

my $warnings = getWarnings( "testLog" );
my $keySizeOfWarnings = keys %$warnings;
my $keySizeOfLineNums = keys %{$warnings->{"src/ext/fileOne.c"}};

ok( getFilePath($log[0]) eq "src/ext/exThapi.c" ); # 1
ok( getLineNum($log[0]) eq "993" ); # 2
ok( getWarningMsg($log[0]) eq "unused variable ‘nilOop’" ); # 3

ok( $keySizeOfWarnings == 4 ); # 4
ok( $keySizeOfLineNums == 3 ); # 5

ok( (sort keys $warnings)[1] eq "src/ext/fileOne.c" ); # 6
ok( (sort keys $warnings->{"src/ext/fileOne.c"})[1] eq "1250" ); # 7

ok( $warnings->{"src/ext/fileOne.c"}->{"1250"}->[0] eq "unused variable ‘poopTable’" ); # 8
ok( $warnings->{"src/ext/fileOne.c"}->{"1250"}->[1] eq "unused variable ‘nilOop’" ); # 9
