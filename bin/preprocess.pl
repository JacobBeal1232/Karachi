#!/usr/bin/perl
#
#   Packages and modules
#
use strict;
use warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Text::CSV  1.32;   # We will be using the CSV module (version 1.32 or higher)
                       # to parse each line

#
#       preProcess.pl
#      Date of Last Update: March 18, 2019.

#      Commandline Parameters: 1
#         $ARGV[0] = file to process
#         $ARGV[1] = file type output
#

#
#   Variables to be used
#
my $EMPTY = q{};
my $SPACE = q{ };
my $COMMA = q{,};


my $filename     = $EMPTY;
my @records;
my $record_count = 0;
my @productDate;
my @productArea;
my @productType;
my @productValue;
my @location;
my @locationToBePrinted;
my @areaPopulation;
my $csv = Text::CSV->new({ sep_char => $COMMA });
my $readFileName;
my $questionType;
#
#   Check that you have the right number of parameters
#
if ($#ARGV != 1 ) {
   print "Usage: preProcess.pl <filename> <questionnumber>\n" or
      die "Print failure\n";
   exit;
} else {
    $readFileName = $ARGV[0];
    $questionType = $ARGV[1];
}


#
#   Open the input file and load the contents into records array
#

    open my $file, '<:encoding(UTF-8)', $readFileName
        or die "Unable to open names file: $readFileName\n";

    @records = <$file>;

    close $file
        or die "Unable to close: $readFileName\n";   # Close the input file
if($questionType == 1){
    foreach my $cost_record ( @records ) {
        if ( $csv->parse($cost_record) ) {
            my @master_fields = $csv->fields();
            if ($master_fields[3] eq "Alcoholic beverages" | $master_fields[3] eq "Education and reading") {
                $record_count++;
                $productDate[$record_count] = $master_fields[0];
                $productArea[$record_count] = $master_fields[1];
                $productType[$record_count]  = $master_fields[3];
                $productValue[$record_count] = $master_fields[9];
                $productArea[$record_count] =~ s/,//;
                $productType[$record_count] =~ s/,//;
            }
        }
        else {
                warn "Line/record could not be parsed: $records[$record_count]\n";
        }
    }
    open (my $fh, ">priceIndex.csv") or die "$!";
    for my $j (1..$record_count) {
        print $fh "$productDate[$j]".", "."$productArea[$j]".", "."$productType[$j]".", "."$productValue[$j]"."\n";
    }
    close ($fh);
}
elsif($questionType == 2){
    foreach my $census_record ( @records ) {
        if( $csv->parse($census_record)) {
            my @master_fields = $csv->fields();
            if ($master_fields[9] eq "Population, 2016"){
                $record_count++;
                $location[$record_count] = $master_fields[3];
                $location[$record_count] =~ s/,//;
                $areaPopulation[$record_count] = $master_fields[12];
            }
        }
        else {
            warn "Line/record could not be parsed: $records[$record_count]\n";
        }
    }
    open (my $fh, ">censusProcessed.csv") or die "$!";
    for my $i (1..$record_count) {
        print $fh "$location[$i]".","."$areaPopulation[$i]"."\n";
    }
    close($fh);
}
elsif($questionType == 3){
  foreach my $cost_record ( @records ) {
      if ( $csv->parse($cost_record) ) {
          my @master_fields = $csv->fields();
          if ($master_fields[3] eq "Rented accommodation" | $master_fields[3] eq "Owned accommodation") {
              $record_count++;
              $productDate[$record_count] = $master_fields[0];
              $productArea[$record_count] = $master_fields[1];
              $productType[$record_count]  = $master_fields[3];
              $productValue[$record_count] = $master_fields[9];
              $productArea[$record_count] =~ s/,//;
              $productArea[$record_count] =~ s/,//;
              $productType[$record_count] =~ s/,//;
          }
      }
      else {
              warn "Line/record could not be parsed: $records[$record_count]\n";
      }
  }
  open (my $fh, ">priceIndex3.csv") or die "$!";
  for my $j (1..$record_count) {
      print $fh "$productDate[$j]".", "."$productArea[$j]".", "."$productType[$j]".", "."$productValue[$j]"."\n";
  }
  close ($fh);
}
#
#   End of Script
#
