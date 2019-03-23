#!/usr/bin/perl
#
#   Packages and modules;
#
#require dataFormat;
use strict;
use warnings;
use version;    our $VERSION = qv('5.16.0');
use Text::CSV 1.32; #to parse lines
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(dirname abs_path $0) .'/lib';
use Rsorter qw(graph1 graph2 graph3 graph4);
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
do
{
	print "Enter a number between 1 and 4.\n";
    chomp ($response = <>);
} while ($response < 1| $response > 4);
if ($response == 1)
{
    print "This program takes in data from the Consumer Price Index and outputs the average cost of alcohol per month against the average cost of education per month.\n";
	my $filename = '/lib/priceindex1.csv'; #look for the correct filename
	if (-e $filename)
    {
		graph1();
	}
	else
	{
		print "Couldn't find the file - try preprocessing for question 1 in the preprocessing folder, and then dropping the produced file 'priceindex1.csv' into the lib folder";
	}
}
elsif ($response == 2)
{
    print "This program takes in data from the Consumer Price Index and the Canadian Census, as well as a region entered by you, and outputs the change in cost of traditional and new communications systems over the period lasting from 1993-2018.\n";
	print "Which region would you like to check?\n1. British Columbia\n2. Alberta\n3. Saskatchewan\n4. Manitoba\n5. Ontario\n6. Quebec\n7. Nova Scotia\n8. Newfoundland and Labrador\n9. New Brunswick\n10. Prince Edwards Island\n";
	$response = 0;
	do
	{
		print "Enter a number between 1 and 10.\n";
		chomp ($response = <>);
	} while ($response < 1 | $response > 10);
	my $filename = '/lib/priceindex2.csv'; #look for the correct filename
	if (-e $filename) #check if the file exists
    {
		graph2($response);
	}
	else
	{
		print "Couldn't find the file - try preprocessing for question 2 in the preprocessing folder, and then dropping the produced file 'priceindex2.csv' into the lib folder";
	}
}
elsif ($response == 3)
{
    print "This program takes in data from the Consumer Price Index, as well as a start and year end entered by you, and outputs the average rate of change between the cost of owning and renting a home.\n";
	print "Which year would you like to start at?\n";
	my $startYear = 0;
	do
	{
		print "Enter any year between 1970 and 2017.\n";
		chomp ($startYear = <>);
	} while ($startYear < 1969 | $startYear > 2017);
	my $endYear = 0;
	do
	{
		print "Enter any year between your start year of ".$startYear." and 2018.\n";
		chomp ($endYear = <>);
	} while ($endYear <= $startYear | $startYear > 2018);
	my $filename = '/lib/priceindex3.csv'; #look for the correct filename
	if (-e $filename) #check if the file exists
    {
		graph3($startYear $endYear);
	}
	else
	{
		print "Couldn't find the file - try preprocessing for question 3 in the preprocessing folder, and then dropping the produced file 'priceindex3.csv' into the lib folder";
	}
}
elsif ($response == 4)
{
    print "This program takes in data from the Consumer Price Index, as well as a product category and Province entered by you, and outputs the Price Index value for that category in that province compared to the national average over the period lasting from 1988-2018.\n";
	print "What product category would you like you check?\n1. Food		2. Household cleaning products\n3. Paper, plastic and aluminum foil supplies		4. Pet foods and supplies\n5. Seeds, plants and cut flowers		6. Household furnishing and equipment\n7. Cooking appliances		8. Clothing and Footwear\n9. Purchase and leasing of passenger vehicles		10. Health and personal care\n11. Sporting and exercise equipment		12. Toys, games, and hobby supplies\n13. Photographic equipment and supplies		14. Home entertainment equipment, parts and services\n15. Video and audio subscription services		16. Reading material\n";
	do
	{
		print "Enter a number between 1 and 16.\n";
		chomp ($response = <>);
	} while ($response < 1 | $response > 16);
	my $filename = '/lib/priceindex4-'.$response; #look for the correct filename - include the product type
	if (-e $filename) #check if the file exists
    {
		graph4($response);
	}
	else
	{
		print "Couldn't find the file - try preprocessing for question 4 in the preprocessing folder with your chosen product, and then dropping the produced file 'priceindex4-x.csv' into the lib folder";
	}
}
