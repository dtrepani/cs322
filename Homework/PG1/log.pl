#!/usr/bin/perl
use strict;
use warnings;

my $filePathPat = qr/[^"\t\s]*\/.+\.[ch]/;
my $lineNumPat = qr/\d+/;
my $warningMsgPat = qr/[^,\n\"]*/;
my $warningPat = qr/($filePathPat):($lineNumPat): warning: ($warningMsgPat)/;

printWarnings( getWarnings("mklog") );

# hashTableRef getWarnings ( aFilenameString )
#   Parse the given log file to find all files with warnings, followed by a list
#   of line numbers with warnings and then a list of the warnings themselves.
#	This is achieved via an array of warnings, inside a hash table of lines
#	numbers, inside a hash table of file paths.
sub getWarnings {
	my $filename = shift;
	my %warnings = ();

	open(my $logFile, '<', $filename)
		or die("open(): Could not open file '$filename'");

	while(my $line = <$logFile> ) {
		if( $line =~ $warningPat ) {
			my $srcFile = getFilePath( $line );
			my $lineNum = getLineNum( $line );
			my @warningMsg = getWarningMsg( $line );

			if( exists($warnings{$srcFile}) ) {
				if( exists($warnings{$srcFile}->{$lineNum}) ) {
					push $warnings{$srcFile}->{$lineNum}, getWarningMsg( $line );
				} else {
					$warnings{$srcFile}->{$lineNum} = \@warningMsg;
				}
			} else {
				my %lineNumHash = ( $lineNum => \@warningMsg );
				$warnings{$srcFile} = \%lineNumHash;
			}
		}
	}

	close($filename);

	return \%warnings;
}

# void printWarnings ( aHashTableRef )
#	Print the hash table out in the following format:
#	filePath
#	   Line lineNumber:
#	      > warningMessage
sub printWarnings {
	my $warnings = shift;

	foreach my $filePath ( sort keys $warnings ) {
		print $filePath . "\n";

		foreach my $lineNum ( sort keys $warnings->{$filePath} ) {
			print "   Line " . $lineNum . ":\n";

			while ( my ($key, $warningMsg) = each $warnings->{$filePath}->{$lineNum} ) {
				print "      > " . $warningMsg . "\n";
			}
		}
	}
}

# string getFilePath( aString )
#   Looking for pattern, filePath:lineNumber: warning: warningMessage
sub getFilePath {
	my $logString = shift;

	if( $logString =~ $warningPat ) {
		return $1;
	}

	return "";
}

# string getLineNum ( aString )
#   Looking for pattern, filePath:lineNumber: warning: warningMessage
sub getLineNum {
	my $logString = shift;

	if( $logString =~ $warningPat ) {
		return $2;
	}

	return "";
}

# string getWarningMsg ( aString )
#   Looking for pattern, filePath:lineNumber: warning: warningMessage
sub getWarningMsg {
	my $logString = shift;

	if( $logString =~ $warningPat ) {
		return $3;
	}

	return "";
}

1;
