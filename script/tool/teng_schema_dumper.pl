#!/usr/bin/env perl
use warnings;
use v5.20.1;

use DBI;
use Teng::Schema::Dumper;
use Data::Dumper;

my $dbh = DBI->connect(
    "DBI:mysql:dbname=lax;", 'lax', '',
    {
        AutoCommit => 0,
        RaiseError => 1,
    }
);

my $dump =  Teng::Schema::Dumper->dump(
    dbh       => $dbh,
    namespace => "Lax::DB",
);

say $dump;

$dbh->disconnect;
