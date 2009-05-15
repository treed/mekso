#!/usr/bin/perl
# $Id: create_language.pl 38376 2009-04-26 15:18:51Z pmichaud $

use strict;
use warnings;

my @files = @ARGV;

print <<"END_PRELUDE";
# This file automatically generated by $0.

END_PRELUDE

foreach my $file (@files) {
    print ".include '$file'\n";
}


