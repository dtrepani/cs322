#!/usr/bin/perl
use strict;
use warnings;

my %gradeTable = (
	Matt=>3.9,
	Linda=>"0.2",
	YoungsterJoey=>2.7,
	Rattata=>4.0,
	Shorts=>3.2
);

# float classAverage( gradeTableRef )
#	return average of grades in table
sub classAverage {
	my $gradeTableRef = shift;
	my $totalGPA = my $numOfGrades = 0;

	while( my ($key, $value) = each(%{$gradeTableRef}) ) {
		$totalGPA += $value;
		$numOfGrades++;
	}

	# print qq{Total GPA is $totalGPA and number of grades is $numOfGrades.\n};

	return $totalGPA/$numOfGrades;
}

my $classAverage = classAverage( \%gradeTable );
print qq{Class average is $classAverage.\n};

1;
