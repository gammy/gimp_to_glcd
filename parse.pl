#!/usr/bin/perl
# Horrible hack for debugging.
use warnings;
use strict;

sub dec2bin {
    my $str = unpack("b32", pack("N", shift));
    $str = substr($str, 24);
    return $str;
}

my $in = shift;
$in=~s/[ |\n]//gs;
my @val = split /,/, $in;
chomp @val;

my $offset = 0;
foreach my $hex (@val) {
	my $byte_string = dec2bin(hex($hex));
	$byte_string=~s/0/ /g;
	print "$byte_string\n";
	$offset++;
	if($offset % 64 == 0) {
		print "========\n";
	}
}
