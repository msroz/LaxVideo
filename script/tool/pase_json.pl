#!/usr/bin/env perl
use warnings;
use v5.20.1;

use JSON::Parse qw/json_file_to_perl/;

my @fields = qw/
    uri
    name
    description
    link
    duration
    width
    height
    pictures

/;

my $p = json_file_to_perl('file/vimeo_search_for_lacrosse.json');
use Data::Dumper; print Dumper $p->{data}[0];
