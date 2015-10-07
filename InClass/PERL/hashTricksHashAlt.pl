#!/usr/bin/perl
use strict;
use warnings;

my $studentPat = qr/([^:]*):(([^:]*):([^:]*))/;

# nameString getName( aStudentString )
#   looking for pattern name:class:grade
#   assumes legal student pattern
sub getName {
    my $aStudentString = shift;

    if( $aStudentString =~ $studentPat ) {
        return $1;
    }

    return "";
}

# classAndGradeString getClassAndGrade( aStudentString )
#   looking for pattern name:class:grade
#   assumes legal student pattern
sub getClassAndGrade {
    my $aStudentString = shift;

    if( $aStudentString =~ $studentPat ) {
        return $2;
    }

    return "";
}

# hashTableRef getGradeSheet ( studentStrings[] )
sub getGradeSheet {
    my @studentStrings = @_;
    my %gradeSheet = ();

    foreach( @studentStrings ) {
        my $studentName = getName($_);
        my $className = getClass($_);
        my $grade = getGrade($_);

        if( ! exists($gradeSheet{$studentName}) ) {
            my %courseInfo = ();
            $gradeSheet{$studentName} = \%courseInfo;
        }

        $gradeSheet{$studentName}->{$className} = $grade;
    }

    return \%gradeSheet;
}

1;
