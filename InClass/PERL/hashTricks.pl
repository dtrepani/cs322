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

        if( exists($gradeSheet{$studentName}) ) {
            #   add class and grade to arrayRef (i.e., push)
            push $gradeSheet{$studentName}, getClassAndGrade($_);
        } else {
            #   put a new arrayRef with class and grade at student name
            my @courseInfo = ( getClassAndGrade($_) );
            $gradeSheet{$studentName} = \@courseInfo;
        }

        $gradeSheet{$studentName} = getClassAndGrade($_);
    }

    return \%gradeSheet;
}

1;
