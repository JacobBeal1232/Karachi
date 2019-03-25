#!/usr/bin/perl
#
#   Packages and modules
#
package Rsorter;
use strict;
use warnings;
use version;         our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Statistics::R;
use Exporter qw(import);

our @EXPORT_OK = qw(graph1 graph2 graph3 graph4);
#
# Rsorter.pm
#
#   Authors: Alex Jetleb (1042992), Jacob Serafin(1071173), Jacob Beal(105704)
#
#   Project: Answers Demo
#   Date of Last Update: March 25, 2019
#
#   Functional Summary
#   Rsorter.pm answers questions asked in main.pl and outputs graphs to answer those questions
#


#
#   Variables to be used
#

sub graph1
{
  #open parsed index and get average of all values
  my $EMPTY = q{};
  my $SPACE = q{ };
  my $COMMA = q{,};

  my @records;
  my $recordCount = 0;
  my @refMonth;
  my @refYear;
  my @locationProductGroup;
  my @consumerPriceIndex;
  my @product;
  my @count;

  my @total;
  for (my $d = 0; $d < 13; $d++) {
      for (my $i = 0; $i<23; $i++){
          $total[$d][$i] = 0;
      }
  }
  for (my $i =0; $i<23;$i++)
  {
      $count[$i]=0;
  }
  $refMonth[0] = 0;
  $locationProductGroup[0] = '';
  my $filename    = $EMPTY;
  my $csv     = Text::CSV->new({ sep_char => $COMMA });

  $filename = '../lib/QuestionOne/priceIndex1.csv';
  open my $file, '<:encoding(UTF-8)', $filename
      or die "Unable to open file: $filename\n";

  @records = <$file>;
  close $file
      or die "Unable to close: $filename";

  foreach my $recordList ( @records ) {
      if ( $csv->parse($recordList) ) {
          my @master_fields = $csv->fields();
          $recordCount++;
          $refMonth[$recordCount] = $master_fields[0];
          $refYear[$recordCount] = $master_fields[1];
          $locationProductGroup[$recordCount] = $master_fields[2];
          $consumerPriceIndex[$recordCount] = $master_fields[3];
      } else {
          warn "Line/record could not be parsed: $records[$recordCount]\n";
      }
  }

  #add up all CPI values
  for(my $k = 0; $k<=$recordCount; $k++){
  	for (my $n = 1; $n<=12; $n++) {
  		if (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Canada: Alcoholic beverages')){
        $total[$n][0] = $total[$n][0] + $consumerPriceIndex[$k];
        $count[0]++;
  			$product[1] = 'Canada: Alcoholic beverages';
   		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Canada: Education and reading')){
        $total[$n][1] = $total[$n][1] + $consumerPriceIndex[$k];
        $count[1]++;
  			$product[2] = 'Canada: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Newfoundland and Labrador: Alcoholic beverages')){
        $total[$n][2] = $total[$n][2] + $consumerPriceIndex[$k];
        $count[2]++;
  			$product[3] = 'Newfoundland and Labrador: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Newfoundland and Labrador: Education and reading')){
        $total[$n][3] = $total[$n][3] + $consumerPriceIndex[$k];
        $count[3]++;
  			$product[4] = 'Newfoundland and Labrador: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Prince Edward Island: Alcoholic beverages')){
        $total[$n][4] = $total[$n][4] + $consumerPriceIndex[$k];
        $count[4]++;
  			$product[5] = 'Prince Edward Island: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Prince Edward Island: Education and reading')){
        $total[$n][5] = $total[$n][5] + $consumerPriceIndex[$k];
        $count[5]++;
  			$product[6] = 'Prince Edward Island: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Nova Scotia: Alcoholic beverages')){
        $total[$n][6] = $total[$n][6] + $consumerPriceIndex[$k];
        $count[6]++;
  			$product[7] = 'Nova Scotia: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Nova Scotia: Education and reading')){
        $total[$n][7] = $total[$n][7] + $consumerPriceIndex[$k];
        $count[7]++;
  			$product[8] = 'Nova Scotia: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'New Brunswick: Alcoholic beverages')){
        $total[$n][8] = $total[$n][8] + $consumerPriceIndex[$k];
        $count[8]++;
  			$product[9] = 'New Brunswick: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'New Brunswick: Education and reading')){
        $total[$n][9] = $total[$n][9] + $consumerPriceIndex[$k];
        $count[9]++;
  			$product[10] = 'New Brunswick: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Quebec: Alcoholic beverages')){
        $total[$n][10] = $total[$n][10] + $consumerPriceIndex[$k];
        $count[10]++;
  			$product[11] = 'Quebec: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Quebec: Education and reading')){
        $total[$n][11] = $total[$n][11] + $consumerPriceIndex[$k];
        $count[11]++;
  			$product[12] = 'Quebec: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Ontario: Alcoholic beverages')){
        $total[$n][12] = $total[$n][12] + $consumerPriceIndex[$k];
        $count[12]++;
  			$product[13] = 'Ontario: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Ontario: Education and reading')){
        $total[$n][13] = $total[$n][13] + $consumerPriceIndex[$k];
        $count[13]++;
  			$product[14] = 'Ontario: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Manitoba: Alcoholic beverages')){
        $total[$n][14] = $total[$n][14] + $consumerPriceIndex[$k];
        $count[14]++;
  			$product[15] = 'Manitoba: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Manitoba: Education and reading')){
        $total[$n][15] = $total[$n][15] + $consumerPriceIndex[$k];
        $count[15]++;
  			$product[16] = 'Manitoba: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Saskatchewan: Alcoholic beverages')){
        $total[$n][16] = $total[$n][16] + $consumerPriceIndex[$k];
        $count[16]++;
  			$product[17] = 'Saskatchewan: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Saskatchewan: Education and reading')){
        $total[$n][17] = $total[$n][17] + $consumerPriceIndex[$k];
        $count[17]++;
  			$product[18] = 'Saskatchewan: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Alberta: Alcoholic beverages')){
        $total[$n][18] = $total[$n][18] + $consumerPriceIndex[$k];
        $count[18]++;
  			$product[19] = 'Alberta: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'Alberta: Education and reading')){
        $total[$n][19] = $total[$n][19] + $consumerPriceIndex[$k];
        $count[19]++;
  			$product[20] = 'Alberta: Education and reading';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'British Columbia: Alcoholic beverages')){
        $total[$n][20] = $total[$n][20] + $consumerPriceIndex[$k];
        $count[20]++;
  			$product[21] = 'British Columbia: Alcoholic beverages';
  		}
  		elsif (($refMonth[$k] == $n) && ($locationProductGroup[$k] eq 'British Columbia: Education and reading')){
        $total[$n][21] = $total[$n][21] + $consumerPriceIndex[$k];
        $count[21]++;
  			$product[22] = 'British Columbia: Education and reading';
  		}
    }
  }
  for (my $i =0; $i<23;$i++)
  {
      $count[$i]= $count[$i]/12;
  }
  #divide by total years to get average per month
  for my $j(1..12){
    for my $p(0..21){
        $total[$j][$p] = $total[$j][$p]/$count[$p];
    }
  }
  open ( my $fileh1, ">../bin/QuestionOne/plot1.txt") or die "$!";
  open ( my $fileh2, ">../bin/QuestionOne/plot2.txt") or die "$!";
  open ( my $fileh3, ">../bin/QuestionOne/plot3.txt") or die "$!";
  open ( my $fileh4, ">../bin/QuestionOne/plot4.txt") or die "$!";
  open ( my $fileh5, ">../bin/QuestionOne/plot5.txt") or die "$!";
  open ( my $fileh6, ">../bin/QuestionOne/plot6.txt") or die "$!";
  open ( my $fileh7, ">../bin/QuestionOne/plot7.txt") or die "$!";
  open ( my $fileh8, ">../bin/QuestionOne/plot8.txt") or die "$!";
  open ( my $fileh9, ">../bin/QuestionOne/plot9.txt") or die "$!";
  open ( my $fileh10, ">../bin/QuestionOne/plot10.txt") or die "$!";



    print $fileh1 ("Category,Month,CPI\n");
    print $fileh2 ("Category,Month,CPI\n");
    print $fileh3 ("Category,Month,CPI\n");
    print $fileh4 ("Category,Month,CPI\n");
    print $fileh5 ("Category,Month,CPI\n");
    print $fileh6 ("Category,Month,CPI\n");
    print $fileh7 ("Category,Month,CPI\n");
    print $fileh8 ("Category,Month,CPI\n");
    print $fileh9 ("Category,Month,CPI\n");
    print $fileh10 ("Category,Month,CPI\n");
  for my $j (1..12){
    print $fileh1 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh1 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh2 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh2 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh3 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh3 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh4 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh4 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh5 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh5 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh6 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh6 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh7 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh7 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh8 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh8 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh9 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh9 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh10 ("$product[1],"."$j,"."$total[$j][0]"."\n");
    print $fileh10 ("$product[2],"."$j,"."$total[$j][1]"."\n");
    print $fileh1 ("$product[3],"."$j,"."$total[$j][2]"."\n");
    print $fileh1 ("$product[4],"."$j,"."$total[$j][3]"."\n");
    print $fileh2 ("$product[5],"."$j,"."$total[$j][4]"."\n");
    print $fileh2 ("$product[6],"."$j,"."$total[$j][5]"."\n");
    print $fileh3 ("$product[7],"."$j,"."$total[$j][6]"."\n");
    print $fileh3 ("$product[8],"."$j,"."$total[$j][7]"."\n");
    print $fileh4 ("$product[9],"."$j,"."$total[$j][8]"."\n");
    print $fileh4 ("$product[10],"."$j,"."$total[$j][9]"."\n");
    print $fileh5 ("$product[11],"."$j,"."$total[$j][10]"."\n");
    print $fileh5 ("$product[12],"."$j,"."$total[$j][11]"."\n");
    print $fileh6 ("$product[13],"."$j,"."$total[$j][12]"."\n");
    print $fileh6 ("$product[14],"."$j,"."$total[$j][13]"."\n");
    print $fileh7 ("$product[15],"."$j,"."$total[$j][14]"."\n");
    print $fileh7 ("$product[16],"."$j,"."$total[$j][15]"."\n");
    print $fileh8 ("$product[17],"."$j,"."$total[$j][16]"."\n");
    print $fileh8 ("$product[18],"."$j,"."$total[$j][17]"."\n");
    print $fileh9 ("$product[19],"."$j,"."$total[$j][18]"."\n");
    print $fileh9 ("$product[20],"."$j,"."$total[$j][19]"."\n");
    print $fileh10 ("$product[21],"."$j,"."$total[$j][20]"."\n");
    print $fileh10 ("$product[22],"."$j,"."$total[$j][21]"."\n");

  }
  close($fileh1);
  close($fileh2);
  close($fileh3);
  close($fileh4);
  close($fileh5);
  close($fileh6);
  close($fileh7);
  close($fileh8);
  close($fileh9);
  close($fileh10);


  # Create a communication bridge with R and start R
  my $R = Statistics::R->new();
  # Set up the PDF file for plots
  $R->run(qq`pdf("../bin/QuestionOne/Plots.pdf", width=22,height =17)`);
  # Load the plotting library
  $R->run(q`library(ggplot2)`);
  # read in data from a CSV file
  for my $k (1..10){
    $R->run(qq`data <- read.csv("../bin/QuestionOne/plot$k.txt")`);
    # plot the data as a line plot with each point outlined
    $R->run(q`ggplot(data, aes(x=Month, y=CPI, colour=Category, group=Category)) + geom_line() + geom_point(size=2) + labs(title = "Alcohol vs Education Monthly Trends", subtitle ="Average per Area 1985 - 2018 ") + ylab("Average CPI Value") + xlab("Month") + scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9,10,11,12), labels=c("","Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"))`);
  }

  # close down the PDF device
  $R->run(q`dev.off()`);

  $R->stop();

} 1;

sub graph2
{
  #open processed index and get average of all values
  my $EMPTY = q{};
  my $SPACE = q{ };
  my $COMMA = q{,};

  my @records;
  my @yearRecord;
  my @regionRecord;
  my @indexRecord;

  my $filename    = $EMPTY;
  my $csv     = Text::CSV->new({ sep_char => $COMMA });

  my $recordCount = 0;

  $filename = '../lib/QuestionTwo/priceIndex2.csv';
  open my $file, '<:encoding(UTF-8)', $filename
      or die "Unable to open file: $filename\n";

  @records = <$file>;

  close $file
      or die "Unable to close: $filename\n";

  foreach my $recordList ( @records ) {
      if ( $csv->parse($recordList) ) {
          my @master_fields = $csv->fields();
          $yearRecord[$recordCount] = $master_fields[0];
          $regionRecord[$recordCount] = $master_fields[1];
          $indexRecord[$recordCount] = $master_fields[2];
          $recordCount++;
      } else {
          warn "Line/record could not be parsed: $records[$recordCount]\n";
      }
  }

  open (my $fileh0, ">../bin/QuestionTwo/plot0.txt")
    or die "$!";
    print $fileh0 "City,"."Year,"."CPI"."\n";
  open (my $fileh1, ">../bin/QuestionTwo/plot1.txt")
    or die "$!";
    print $fileh1 "City,"."Year,"."CPI"."\n";
  open (my $fileh2, ">../bin/QuestionTwo/plot2.txt")
    or die "$!";
    print $fileh2 "City,"."Year,"."CPI"."\n";
  open (my $fileh3, ">../bin/QuestionTwo/plot3.txt")
    or die "$!";
    print $fileh3 "City,"."Year,"."CPI"."\n";
  open (my $fileh4, ">../bin/QuestionTwo/plot4.txt")
    or die "$!";
    print $fileh4 "City,"."Year,"."CPI"."\n";
  open (my $fileh5, ">../bin/QuestionTwo/plot5.txt")
    or die "$!";
    print $fileh5 "City,"."Year,"."CPI"."\n";

  my @averageToronto;
  my @averageVancouver;
  my @averageCalgary;
  my @averageHalifax;
  my @averageYellowknife;
  my @averageWhitehorse;
  for(my $currentYear = 0; $currentYear < 25; $currentYear++) #for number of years
  {
    $averageToronto[$currentYear] = 0; #initialize
    $averageVancouver[$currentYear] = 0;
    $averageCalgary[$currentYear] = 0;
    $averageHalifax[$currentYear] = 0;
    $averageYellowknife[$currentYear] = 0;
    $averageWhitehorse[$currentYear] = 0;
    for (my $colCounter = 0; $colCounter < 72; $colCounter++)
    {
      if ($colCounter % 6 == 0)
      {
        $averageHalifax[$currentYear] = $averageHalifax[$currentYear] + $indexRecord[($currentYear*72)+$colCounter];
      }
      elsif ($colCounter % 6 == 1)
      {
        $averageToronto[$currentYear] = $averageToronto[$currentYear] + $indexRecord[($currentYear*72)+$colCounter];
      }
      elsif ($colCounter % 6 == 2)
      {
        $averageCalgary[$currentYear] = $averageCalgary[$currentYear] + $indexRecord[($currentYear*72)+$colCounter];
      }
      elsif ($colCounter % 6 == 3)
      {
        $averageVancouver[$currentYear] = $averageCalgary[$currentYear] + $indexRecord[($currentYear*72)+$colCounter];
      }
      elsif ($colCounter % 6 == 4)
      {
        $averageWhitehorse[$currentYear] = $averageCalgary[$currentYear] + $indexRecord[($currentYear*72)+$colCounter];
      }
      elsif ($colCounter % 6 == 5)
      {
        $averageYellowknife[$currentYear] = $averageCalgary[$currentYear] + $indexRecord[($currentYear*72)+$colCounter];
      }
    }
    $averageToronto[$currentYear] = $averageToronto[$currentYear]/12;
    $averageVancouver[$currentYear] = $averageVancouver[$currentYear]/12;
    $averageCalgary[$currentYear] = $averageCalgary[$currentYear]/12;
    $averageHalifax[$currentYear] = $averageHalifax[$currentYear]/12;
    $averageYellowknife[$currentYear] = $averageYellowknife[$currentYear]/12;
    $averageWhitehorse[$currentYear] = $averageWhitehorse[$currentYear]/12;
    my $printYear = $currentYear + 1991;

    print $fileh0 "Toronto all goods,"."$printYear".","."$averageToronto[$currentYear]"."\n";
    print $fileh1 "Vancouver all goods,"."$printYear".","."$averageVancouver[$currentYear]"."\n";
    print $fileh2 "Calgary all goods,"."$printYear".","."$averageCalgary[$currentYear]"."\n";
    print $fileh3 "Halifax all goods,"."$printYear".","."$averageHalifax[$currentYear]"."\n";
    print $fileh4 "Yellowknife all goods,"."$printYear".","."$averageYellowknife[$currentYear]"."\n";
    print $fileh5 "Whitehorse all goods,"."$printYear".","."$averageWhitehorse[$currentYear]"."\n";
  }

  close ($fileh0);
  close ($fileh1);
  close ($fileh2);
  close ($fileh3);
  close ($fileh4);
  close ($fileh5);

  my $w;
  # Create a communication bridge with R and start R
  my $R = Statistics::R->new();
  # Set up the PDF file for plots
  $R->run(qq`pdf("../bin/QuestionTwo/CityPlots.pdf", width=22, height =17 )`);
  # Load the plotting library
  $R->run(q`library(ggplot2)`);
  # read in data from a CSV file
for ($w = 0; $w < 6; $w++){
  $R->run(qq`data <- read.csv("../bin/QuestionTwo/plot$w.txt")`);
  # plot the data as a line plot with each point outlined
  $R->run(q`ggplot(data, aes(x=Year, y=CPI, colour=City, group=City)) + geom_line() + geom_point(size=2) + labs(title = "Change in Price of all Goods over Time", subtitle = "Cities 1991-2016") + ylab("Average CPI Value") + xlab("Year")`);
}
  # close down the PDF device
  $R->run(q`dev.off()`);
  $R->stop();

} 1;

sub graph3
{
  my $startYear = $_[0];
  my $endYear = $_[1];
  #open processed index and get average of all values
  my $EMPTY = q{};
  my $SPACE = q{ };
  my $COMMA = q{,};

  my @records;
  my @refYear;
  my @productGroup;
  my @consumerPriceIndex;

  my $filename    = $EMPTY;
  my $csv     = Text::CSV->new({ sep_char => $COMMA });

  my $recordCount = 0;

  $filename = '../lib/QuestionThree/priceIndex3.csv';
  open my $file, '<:encoding(UTF-8)', $filename
      or die "Unable to open file: $filename\n";

  @records = <$file>;

  close $file
      or die "Unable to close: $filename\n";

  foreach my $recordList ( @records ) {
      if ( $csv->parse($recordList) ) {
          my @master_fields = $csv->fields();
          $refYear[$recordCount] = $master_fields[0];
          $productGroup[$recordCount] = $master_fields[1];
          $consumerPriceIndex[$recordCount] = $master_fields[2];
          $recordCount++;
      } else {
          warn "Line/record could not be parsed: $records[$recordCount]\n";
      }
  }
  open (my $fileh, ">../bin/QuestionThree/plot3.txt")
    or die "$!";
  print $fileh "Category,"."Year,"."CPI"."\n";

  my @averageRent;
  my @averageOwned;
  my $startingColumn = (($startYear-1970)*24);
  for(my $currentYear = 0; $currentYear < ($endYear - $startYear + 1); $currentYear++) #for number of years
  {
    $averageRent[$currentYear] = 0; #initialize
    $averageOwned[$currentYear] = 0;
    for (my $colCounter = 0; $colCounter < 24; $colCounter++)
    {
      if ($colCounter % 2 == 0)
      {
        $averageRent[$currentYear] = $averageRent[$currentYear] + $consumerPriceIndex[$startingColumn+($currentYear*24)+$colCounter];
      }
      else
      {
        $averageOwned[$currentYear] = $averageOwned[$currentYear] + $consumerPriceIndex[$startingColumn+($currentYear*24)+$colCounter];
      }
    }
    $averageRent[$currentYear] = $averageRent[$currentYear] / 12;
    $averageOwned[$currentYear] = $averageOwned[$currentYear] / 12;
    my $printYear = $currentYear + $startYear;
    print $fileh "Rented accommodation,"."$printYear".","."$averageRent[$currentYear]"."\n";
    print $fileh "Owned accommodation,"."$printYear".","."$averageOwned[$currentYear]"."\n";
  }
  close ($fileh);
# Create a communication bridge with R and start R
  my $R = Statistics::R->new();

# Set up the PDF file for plots
  $R->run(qq`pdf("../bin/QuestionThree/Question3Plot.pdf", width=22, height =17 )`);

# Load the plotting library
  $R->run(q`library(ggplot2)`);

# read in data from a CSV file
  $R->run(qq`data <- read.csv("../bin/QuestionThree/plot3.txt")`);

  # plot the data as a line plot with each point outlined
$R->run(q`ggplot(data, aes(x=Year, y=CPI, colour=Category, group=Category)) + geom_line() + geom_point(size=2) + labs(title = "Change between Cost of Owned and Rented Accommodation", subtitle ="Average for Canada 1985 - 2018 ") + ylab("Average CPI Value") + xlab("Year")`);
  # close down the PDF device
$R->run(q`dev.off()`);

$R->stop();
} 1;

sub graph4
{
  my $productType = $_[0];
  my $provinceNum = $_[1];
  my $provinceType;
  if ($provinceNum == 1)
  {
    $provinceType = "British Columbia";
  }
  elsif ($provinceNum == 2)
  {
    $provinceType = "Alberta";
  }
  elsif ($provinceNum == 3)
  {
    $provinceType = "Saskatchewan";
  }
  elsif ($provinceNum == 4)
  {
    $provinceType = "Manitoba";
  }
  elsif ($provinceNum == 5)
  {
    $provinceType = "Ontario";
  }
  elsif ($provinceNum == 6)
  {
    $provinceType = "Quebec";
  }
  elsif ($provinceNum == 7)
  {
    $provinceType = "Newfoundland and Labrador";
  }
  elsif ($provinceNum == 8)
  {
    $provinceType = "Nova Scotia";
  }
  elsif ($provinceNum == 9)
  {
    $provinceType = "New Brunswick";
  }
  elsif ($provinceNum == 10)
  {
    $provinceType = "Prince Edward Island";
  }

  my $EMPTY = q{};
  my $SPACE = q{ };
  my $COMMA = q{,};

  my @records;
  my @yearRecord;
  my @regionRecord;
  my @indexRecord;

  my $filename    = $EMPTY;
  my $csv     = Text::CSV->new({ sep_char => $COMMA });

  my $recordCount = 0;
  $filename = '../lib/QuestionFour/priceIndex4-'.$productType.'.csv';
  open my $file, '<:encoding(UTF-8)', $filename
      or die "Unable to open file: $filename\n";
  @records = <$file>;
  close $file
      or die "Unable to close: $filename\n";

  foreach my $recordList ( @records ) {
      if ( $csv->parse($recordList) ) {
          my @master_fields = $csv->fields();
          if ($master_fields[1] eq "Canada" || $master_fields[1] eq $provinceType)
          {
            $yearRecord[$recordCount] = $master_fields[0];
            $regionRecord[$recordCount] = $master_fields[1];
            $indexRecord[$recordCount] = $master_fields[3];
            $recordCount++;
          }
      } else {
          warn "Line/record could not be parsed: $records[$recordCount]\n";
      }
  }
  open (my $fileh, ">../bin/QuestionFour/plot4-".$productType.".txt")
    or die "$!";

  print $fileh "Area,"."Year,"."CPI"."\n";

  my @canadaAverage;
  my @provinceAverage;
  for(my $currentYear = 0; $currentYear < 31; $currentYear++) #for all 31 years
  {
    $canadaAverage[$currentYear] = 0; #initialize
    $provinceAverage[$currentYear] = 0;
    for (my $colCounter = 0; $colCounter < 24; $colCounter++)
    {
      if ($colCounter % 2 == 0)
      {
        $canadaAverage[$currentYear] = $canadaAverage[$currentYear] + $indexRecord[($currentYear*24)+$colCounter];
      }
      else
      {
        $provinceAverage[$currentYear] = $provinceAverage[$currentYear] + $indexRecord[($currentYear*24)+$colCounter];
      }
    }
    $canadaAverage[$currentYear] = $canadaAverage[$currentYear] / 12;
    $provinceAverage[$currentYear] = $provinceAverage[$currentYear] / 12;
    my $printYear = $currentYear + 1988;
    print $fileh "Canada Average,"."$printYear".","."$canadaAverage[$currentYear]"."\n";
    print $fileh "$provinceType"." Average,"."$printYear".","."$provinceAverage[$currentYear]"."\n";
  }
  close ($fileh);
  # Create a communication bridge with R and start R
  my $R = Statistics::R->new();

  # Set up the PDF file for plots
  $R->run(qq`pdf("../bin/QuestionFour/Question4Plot.pdf", width=22, height =17 )`);

  # Load the plotting library
  $R->run(q`library(ggplot2)`);

  # read in data from a CSV file
  $R->run(qq`data <- read.csv("../bin/QuestionFour/plot4-$productType.txt")`);

  # plot the data as a line plot with each point outlined
  $R->run(q`ggplot(data, aes(x=Year, y=CPI, colour=Area, group=Area)) + geom_line() + geom_point(size=2) + labs(title = "Change in Price of Item over Time", subtitle ="Average for Canada and selected Province 1988 - 2018 ") + ylab("Average CPI Value") + xlab("Year")`);
  # close down the PDF device
  $R->run(q`dev.off()`);

  $R->stop();
} 1;
