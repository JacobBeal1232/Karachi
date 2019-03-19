#!/usr/bin/perl
#
#   Packages and modules
#
package statsParser;
use strict;
use warnings;
use version;   our $version = qv('5.16.0');
use Text::CSV 1.32;


my $EMPTY = q{};
my $SPACE = q{ };
my $COMMA = q{,};

my @records;
my $recordCount = 0;
my @refDate;
my @location;
my @productGroups;
my @consumerPriceIndex;
my @month;
my @year;

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
        $refDate[$recordCount] = $master_fields[0];
        my @seperate = split('-',$refDate[$recordCount]);
        push @month, $seperate[0];
        push @year, $seperate[1];
        $location[$recordCount] = $master_fields[1];
        $productGroups[$recordCount] = $master_fields[2];
        $consumerPriceIndex[$recordCount] = $master_fields[3];
    } else {
        warn "Line/record could not be parsed: $records[$recordCount]\n";
    }
}
1;


