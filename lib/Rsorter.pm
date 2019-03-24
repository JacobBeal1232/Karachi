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

our @EXPORT_OK = qw(graph1);

sub graph1 {

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

my @total;

my $filename    = $EMPTY;
my $csv     = Text::CSV->new({ sep_char => $COMMA });

$filename = 'priceIndex.csv';
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
open (my $fileh, ">plot1.csv") or die "$!";
print "\"Month\",\"CPI\",\"Category\"\n";

#add up all CPI values
for(my $k = 0; $k<=$record_count2; $k++){
	for (my $n = 1; $n<12; $n++) {
		if (($refMonth == $n) && (locationProductGroup eq 'Canada: Alcoholic beverages')){
			$total[1] = $total[1] + $consumerPriceIndex[k];
			$product[1] = 'Canada: Alcoholic beverages';
 		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Canada: Education and reading')){
			$total[2] = $total[2] + $consumerPriceIndex[k];
			$product[2] = 'Canada: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Newfoundland and Labrador: Alcoholic beverages')){
			$total[3] = $total[3] + $consumerPriceIndex[k];
			$product[3] = 'Newfoundland and Labrador: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Newfoundland and Labrador: Education and reading')){
			$total[4] = $total[4] + $consumerPriceIndex[k];
			$product[4] = 'Newfoundland and Labrador: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Prince Edward Island: Alcoholic beverages')){
			$total[5] = $total[5] + $consumerPriceIndex[k];
			$product[5] = 'Prince Edward Island: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Prince Edward Island: Education and reading')){
			$total[6] = $total[6] + $consumerPriceIndex[k];
			$product[6] = 'Prince Edward Island: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Nova Scotia: Alcoholic beverages')){
			$total[7] = $total[7] + $consumerPriceIndex[k];
			$product[7] = 'Nova Scotia: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Nova Scotia: Education and reading')){
			$total[8] = $total[8] + $consumerPriceIndex[k];
			$product[8] = 'Nova Scotia: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'New Brunswick: Alcoholic beverages')){
			$total[9] = $total[9] + $consumerPriceIndex[k];
			$product[9] = 'New Brunswick: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'New Brunswick: Education and reading')){
			$total[10] = $total[10] + $consumerPriceIndex[k];
			$product[10] = 'New Brunswick: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Quebec: Alcoholic beverages')){
			$total[11] = $total[11] + $consumerPriceIndex[k];
			$product[11] = 'Quebec: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Quebec: Education and reading')){
			$total[12] = $total[12] + $consumerPriceIndex[k];
			$product[12] = 'Quebec: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Ontario: Alcoholic beverages')){
			$total[13] = $total[13] + $consumerPriceIndex[k];
			$product[13] = 'Ontario: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Ontario: Education and reading')){
			$total[14] = $total[14] + $consumerPriceIndex[k];
			$product[14] = 'Ontario: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Manitoba: Alcoholic beverages')){
			$total[15] = $total[15] + $consumerPriceIndex[k];
			$product[15] = 'Manitoba: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Manitoba: Education and reading')){
			$total[16] = $total[16] + $consumerPriceIndex[k];
			$product[16] = 'Manitoba: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Saskatchewan: Alcoholic beverages')){
			$total[17] = $total[17] + $consumerPriceIndex[k];
			$product[17] = 'Saskatchewan: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Saskatchewan: Education and reading')){
			$total[18] = $total[18] + $consumerPriceIndex[k];
			$product[18] = 'Saskatchewan: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Alberta: Alcoholic beverages')){
			$total[19] = $total[19] + $consumerPriceIndex[k];
			$product[19] = 'Alberta: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'Alberta: Education and reading')){
			$total[20] = $total[20] + $consumerPriceIndex[k];
			$product[20] = 'Alberta: Education and reading';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'British Columbia: Alcoholic beverages')){
			$total[21] = $total[21] + $consumerPriceIndex[k];
			$product[21] = 'British Columbia: Alcoholic beverages';
		}
		elsif (($refMonth == $n) && (locationProductGroup eq 'British Columbia: Education and reading')){
			$total[22] = $total[22] + $consumerPriceIndex[k];
			$product[22] = 'British Columbia: Education and reading';
		}
}
#divide by total years to get average per month
for(my $m = 1; $m < 23; $m++){
	total[$m] = total[$m]/(2018-1985+1);
}
#print info to file for plotting
for my $j (1..13){
	for my $p (1..23) {
			print $fileh "$refMonth[$j]".","."$total[$p]".","."$product[$p]".","."\n";
			}
	}
    close ($fileh);

# Create a communication bridge with R and start R
my $R = Statistics::R->new();

# Set up the PDF file for plots
$R->run(qq`pdf("Question1Plot.pdf" , paper="letter")`);

# Load the plotting library
$R->run(q`library(ggplot2)`);

# read in data from a CSV file
$R->run(qq`data <- read.csv("plot1.txt")`);

# plot the data as a line plot with each point outlined
$R->run(q`ggplot(data, aes(x=Month, y=CPI, colour=Category, group=Category)) + geom_line() + geom_point(size=2) + labs(title = "Alcohol vs Education Monthly Trends", subtitle ="Average per Area 1985 - 2018 ") + ylab("CPI Value") + scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9,10,11), labels=c("Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"))`);
# close down the PDF device
$R->run(q`dev.off()`);

$R->stop();
}
1;

