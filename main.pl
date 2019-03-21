#!/usr/bin/perl
#
#   Packages and modules;
#
#require statsParser;
#require dataFormat;
use strict;
use warnings;
use version;    our $VERSION = qv('5.16.0');
use Text::CSV  1.32 #to parse lines

#
# main.pl
#
#   Authors: Alex Jetleb (1042992),
#
#   Project: Answers Demo
#   Date of Last Update: March 18, 2019
#
#   Functional Summary
#   main.pl takes in data from the consumer price index to answer the following question:
#   Over the course of an average year, how have month-to-month trends affected the cost of
#   education and alcohol per province? What correlations can we find between the cost of alcohol
#   And the cost of education in an average month?
#
#   Statistics data from:
#

#
#   Variables to be used
#
my @productName; #this holds all the product names
my @averageCost; #this holds all the CPI values (balanced around 1)
my @provinceName; #this holds all the respective province names
my @monthType; #this holds all the months of the year

print "Select which Question you would like to have answered:\n1.   Over the course of an average year, how have month-to-month trends affected the cost of education and alcohol per province?\n2. In a given area, how have the costs 'traditional' communications systems changed in contrast to the costs of 'new' communications systems when compared to the number of people living there?\n3.   Between two given years, what is the average rate of change between the cost of owning and renting a home?\n4.  How does any individual Province's Consumer Price Index for a specific category compare to the Provincial average?\n";
my $response;
$response  = 0;
while (1 > $response || $response > 5)
{
    chomp ($response = <>);
}
if ($response == 1)
{
    print "This program takes in data from the Consumer Price Index and outputs the average cost of alcohol per month against the average cost of education per month.\n";
    #use fileReader;
    #parser file that turns things into arrays
    #fileReader(@productName, @averageCost, @provinceName, @monthType, 1); #1 indicates file 1, 2 file 2, 3 file 3, and 4 file 4
    print "Data succesfully processed.\n";
    #export to R
    #use rConverter;
    #rConverter(@productName, @averageCost, @provinceName, @monthType, 1);
    print "File has been converted - done!\n";
}
elsif ($response == 2)
{
    print "This program takes in data from the Consumer Price Index and the Canadian Census, as well as a region entered by you, and outputs the change in cost over the period lasting from 1993-2018.\n"
}
elsif ($response == 3)
{
    print "This program takes in data from the Consumer Price Index, as well as a start and year end entered by you, and outputs the average rate of change between the cost of owning and renting a home.\n"
}
elsif ($response == 4)
{
    print "This program takes in data from the Consumer Price Index, as well as a product category and Province entered by you, and outputs the Price Index value for that category in that province compared to the national average.\n"
}
