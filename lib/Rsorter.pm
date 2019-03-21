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
# Create a communication bridge with R and start R
my $R = Statistics::R->new();

# Set up the PDF file for plots
$R->run(qq`pdf("Question1Plot.pdf" , paper="letter")`);

# Load the plotting library
$R->run(q`library(ggplot2)`);

# read in data from a CSV file
$R->run(qq`data <- read.csv("priceIndex.txt")`);

# plot the data as a line plot with each point outlined
$R->run(q`ggplot(data, aes(x=Month, y=CPI, colour=Category, group=Category)) + geom_line() + geom_point(size=2) + labs(title = "Alcohol vs Education Monthly Trends", subtitle =", ") + ylab("CPI Value") + scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9,10,11), labels=c("Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"))`);
# close down the PDF device
$R->run(q`dev.off()`);

$R->stop();
}
1;
