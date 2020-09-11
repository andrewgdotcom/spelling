#!/usr/bin/perl

# A quick and dirty tool to convert canonical fórm text (on STDIN) to common
# fórm text (on STDOUT). Nóte that it may cauze text to overflow riyt marjins,
# só if text justificätjon is critical the output shud bë manüally verifÿed.

use warnings;
use strict;
use utf8;
use open ':std', ':encoding(UTF-8)';
use Getopt::Long;

while (<>) {
	utf8::decode($_);
	tr/áàäćéèëíïńóòöôúùüýÿãẽĩõũ/aaaceeeiinoooouuuyyaeiou/;
	tr/ÁÀÄĆÉÈËÍÏŃÓÒÖÔÚÙÜÝŸÃẼĨÕŨ/AAACEEEIINOOOOUUUYYAEIOU/;
	s/þ/th/g;
	s/([[:upper:]])Þ/$1TH/g;
	s/Þ([[:upper:]])/TH$1/g;
    s/\bÞ\b/TH/g;
	s/Þ/Th/g;
	print;
}
