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
#      Date of Last Update: March 24, 2019.

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
my $csv = Text::CSV->new({ sep_char => $COMMA });

#
#   Check that you have the right number of parameters
#
my $readFileName;
my $questionType;
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

#
#   Field for question type
#
if($questionType == 1){
  my @productDate;
  my @productYear;
  my @productAreaType;
  my @productValue;
  my $record_count = 0;
  foreach my $cost_record(@records)
  {
    if ( $csv->parse($cost_record) )
    {
      my @master_fields = $csv->fields();
      my @splitDate = split('-', $master_fields[0]);
      if ($splitDate[0] > 1984 && $splitDate[0] < 2019)
      {
        if ($master_fields[1] eq "Canada" | $master_fields[1] eq "Newfoundland and Labrador" | $master_fields[1] eq "Prince Edward Island" | $master_fields[1] eq "Nova Scotia" | $master_fields[1] eq "New Brunswick" | $master_fields[1] eq "Quebec" | $master_fields[1] eq "Ontario" | $master_fields[1] eq "Manitoba" | $master_fields[1] eq "Saskatchewan" | $master_fields[1] eq "Alberta" | $master_fields[1] eq "British Columbia")
        {
          if ($master_fields[3] eq "Alcoholic beverages" | $master_fields[3] eq "Education and reading")
          {
            $record_count++;
            $productDate[$record_count] = $splitDate[1];
            $productYear[$record_count] = $splitDate[0];
            $productAreaType[$record_count] = $master_fields[1].": ".$master_fields[3];
            $productAreaType[$record_count] =~ s/,//;
            $productValue[$record_count] = $master_fields[10];
          }
        }
      }
    }
    else
    {
      warn "Line/record could not be parsed: $records[$record_count]\n";
    }
  }
  open (my $fh, ">priceIndex1.csv")
    or die "$!";
  for my $j (1..$record_count)
  {
    print $fh "$productDate[$j]".","."$productYear[$j]".","."$productAreaType[$j]".","."$productValue[$j]"."\n";
  }
  close ($fh);
}
elsif($questionType == 2)
{
    my @productYear;
    my @productArea;
    my @productValue;
    my $record_count = 0;
    foreach my $cost_record (@records)
    {
        if ( $csv->parse($cost_record))
        {
            my @master_fields = $csv->fields();
            my @splitDate = split('-', $master_fields[0]);
            if ($splitDate[0] > 1990 && $splitDate[0] < 2017)
            {
                if ($master_fields[3] eq "All-items")
                {
                    if ($master_fields[1] eq "Toronto, Ontario" || $master_fields[1] eq "Vancouver, British Columbia" ||$master_fields[1] eq "Halifax, Nova Scotia" ||$master_fields[1] eq "Calgary, Alberta" ||$master_fields[1] eq "Whitehorse, Yukon" ||$master_fields[1] eq "Yellowknife, Northwest Territories")
                    {
                        $record_count++;
                        $productYear[$record_count] = $splitDate[0];
                        my @splitArea = split(',', $master_fields[1]);
                        $productArea[$record_count] = $splitArea[0];
                        $productValue[$record_count] = $master_fields[10];
                    }
                }
            }
        }
        else
        {
            warn "Line/record could not be parsed: $records[$record_count]\n";
        }
    }
    open (my $fh, ">priceIndex2.csv")
    or die "$!";
    for my $j (1..$record_count)
    {
        print $fh "$productYear[$j]".","."$productArea[$j]".","."$productValue[$j]"."\n";
    }
    close ($fh);
}
#    my @location;
#    my @areaPopulation;
#    foreach my $census_record ( @records ) {
#        if( $csv->parse($census_record)) {
#            my @master_fields = $csv->fields();
#            if ($master_fields[9] eq "Population, 2016"){
#                $record_count++;
#                $location[$record_count] = $master_fields[3];
#                $location[$record_count] =~ s/,//;
#                $areaPopulation[$record_count] = $master_fields[12];
#            }
#        }
#        else {
#        }
#    }
#    open (my $fh, ">censusProcessed.csv") or die "$!";
#    for my $i (1..$record_count) {
#        print $fh "$location[$i]".","."$areaPopulation[$i]"."\n";
#    }
#    close($fh);
#    foreach my $cost_record ( @records ) {
#        if ( $csv->parse($cost_record) ) {
#            my @master_fields = $csv->fields();
#            if ($master_fields[1] eq "Canada" | $master_fields[1] eq "Newfoundland and Labrador" | $master_fields[1] eq "Prince Edward Island" | $master_fields[1] eq "Nova Scotia" | $master_fields[1] eq "New Brunswick" | $master_fields[1] eq "Quebec" | $master_fields[1] eq "Ontario" | $master_fields[1] eq "Manitoba" | $master_fields[1] eq "Saskatchewan" | $master_fields[1] eq "Alberta" | $master_fields[1] eq "British Columbia")
#            {
#                if ($master_fields[3] eq "Alcoholic beverages" | $master_fields[3] eq "Education and reading")
#                {
#                    my @splitDate = split('-', $master_fields[0]);
#                  $productDate[$record_count] = $splitDate[1];
#                  $productYear[$record_count] = $splitDate[0];
#                    $productArea[$record_count] = $master_fields[1].": ".$master_fields[3];
#                    $productValue[$record_count] = $master_fields[9];
#                    $productArea[$record_count] =~ s/,//;
#                }
#            }
#        }
#        else
#        {
#                warn "Line/record could not be parsed: $records[$record_count]\n";
#        }
#    }
#    open (my $fh, ">priceIndex1.csv") or die "$!";
#    for my $j (1..$record_count) {
#        print $fh "$productDate[$j]".","."$productYear[$j]".","."$productArea[$j]".","."$productValue[$j]"."\n";
#    }
#    close ($fh);
#}
elsif($questionType == 3)
{
  my @productYear;
  my @productType;
  my @productValue;
  my $record_count = 0;
  foreach my $cost_record (@records)
  {
    if ( $csv->parse($cost_record))
    {
      my @master_fields = $csv->fields();
      my @splitDate = split('-', $master_fields[0]);
      if ($splitDate[0] > 1969 && $splitDate[0] < 2019)
      {
        if ($master_fields[3] eq "Rented accommodation" | $master_fields[3] eq "Owned accommodation")
        {
          if ($master_fields[1] eq "Canada")
          {
            $record_count++;
            $productYear[$record_count] = $splitDate[0];
            $productType[$record_count] = $master_fields[3];
            $productValue[$record_count] = $master_fields[10];
          }
        }
      }
    }
    else
    {
      warn "Line/record could not be parsed: $records[$record_count]\n";
    }
  }
  open (my $fh, ">priceIndex3.csv")
    or die "$!";
  for my $j (1..$record_count)
  {
    print $fh "$productYear[$j]".","."$productType[$j]".","."$productValue[$j]"."\n";
  }
  close ($fh);
}
elsif($questionType == 4)
{
  my @productYear;
  my @productType;
  my @productArea;
  my @productValue;
  my $userRequested = 0;
  my $userString;
  my $record_count = 0;
  while ($userRequested < 1 || $userRequested > 16)
  {
	   print "What product category would you like you process for?\n1. Food\n2. Household cleaning products\n3. Paper, plastic and aluminum foil supplies\n4. Household furnishing and equipment\n5. Clothing and Footwear\n6. Purchase and leasing of passenger vehicles\n7. Health and personal care\n8. Home entertainment equipment, parts and services\n9. Video and audio subscription services\n10. Reading material\n";
    chomp($userRequested = <STDIN>);
  }
  if ($userRequested == 1)
  {
    $userString = "Food";
  }
  elsif ($userRequested == 2)
  {
    $userString = "Household cleaning products";
  }
  elsif ($userRequested == 3)
  {
    $userString = "Paper, plastic and aluminum foil supplies";
  }
  elsif ($userRequested == 4)
  {
    $userString = "Household furnishings and equipment";
  }
  elsif ($userRequested == 5)
  {
    $userString = "Clothing and footwear";
  }
  elsif ($userRequested == 6)
  {
    $userString = "Purchase and leasing of passenger vehicles";
  }
  elsif ($userRequested == 7)
  {
    $userString = "Health and personal care";
  }
  elsif ($userRequested == 8)
  {
    $userString = "Home entertainment equipment, parts and services";
  }
  elsif ($userRequested == 9)
  {
    $userString = "Video and audio subscription services";
  }
  elsif ($userRequested == 10)
  {
    $userString = "Reading material (excluding textbooks)";
  }
  foreach my $cost_record (@records)
  {
    if ( $csv->parse($cost_record))
    {
      my @master_fields = $csv->fields();
      my @splitDate = split('-', $master_fields[0]);
      if ($splitDate[0] > 1987 && $splitDate[0] < 2019)
      {
        if ($master_fields[1] eq "Canada" | $master_fields[1] eq "Newfoundland and Labrador" | $master_fields[1] eq "Prince Edward Island" | $master_fields[1] eq "Nova Scotia" | $master_fields[1] eq "New Brunswick" | $master_fields[1] eq "Quebec" | $master_fields[1] eq "Ontario" | $master_fields[1] eq "Manitoba" | $master_fields[1] eq "Saskatchewan" | $master_fields[1] eq "Alberta" | $master_fields[1] eq "British Columbia")
        {
          if ($master_fields[3] eq $userString)
          {
            $record_count++;
            $productYear[$record_count] = $splitDate[0];
            $productArea[$record_count] = $master_fields[1];
            $productType[$record_count] = $master_fields[3];
            $productType[$record_count] =~ s/,//;
            $productValue[$record_count] = $master_fields[10];
          }
        }
      }
    }
    else
    {
      warn "Line/record could not be parsed: $records[$record_count]\n";
    }
  }
  open (my $fh, ">priceIndex4-".$userRequested.".csv")
    or die "$!";
  for my $j (1..$record_count)
  {
    print $fh "$productYear[$j]".","."$productArea[$j]".","."$productType[$j]".","."$productValue[$j]"."\n";
  }
  close ($fh);
}
#
#   End of Script
#
