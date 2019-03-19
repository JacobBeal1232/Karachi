#!/usr/bin/perl
#
#   Packages and modules;
#
require statsParser;
#require dataComparison;
require dataFormat;
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

print "This program takes in data from the Consumer Price Index and outputs the average cost of alcohol per month,\n against the average cost of education per month.";

use fileReader;
#parser file that turns things into arrays
fileReader(@productName, @averageCost, @provinceName, @monthType, 1); #1 indicates file 1, 2 file 2, 3 file 3, and 4 file 4
print "Data succesfully processed.\n";
#comparator file that sorts the data
#use dataCompare;
#dataCompare(@productName, @averageCost, @provinceName, @monthType, 1);
#export to R
use rConverter;
rConverter(@productName, @averageCost, @provinceName, @monthType, 1);
print "File has been converted - done!\n";
