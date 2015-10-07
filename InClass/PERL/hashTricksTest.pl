#!/usr/bin/perl
use strict;
use warnings;
use Test::Simple tests=>4;

require "hashTricks.pl";

my @testInput = ( "Alice:CS:A", "Beth:M:A", "Alice:Shop:A", "Alice:HP:C", "Bob:Math:C", "Ted:CS:B", "Beth:Shop:C" );

ok( getName( $testInput[0] ) eq "Alice" );
ok( getClassAndGrade( $testInput[0] ) eq "CS:A" );

# enrollment should be a hashTable ref
# % --------------------------
# Alice => ReferenceToArray {
#               CS: A,
#               Shop: A,
#               HP: C
#          }
# Beth => { Math: A, Shop: C }
# Bob => { Math: C }
# Ted => { CS: B }
my $enrollment = getGradeSheet( @testInput );
my $keySize = keys($enrollment);
ok( $keySize == 4 );
ok( $enrollment->{"Bob"}->[0] eq "Math:C:" );
