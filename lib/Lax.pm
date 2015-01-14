package Lax;
use strict;
use warnings;
use utf8;
our $VERSION='0.01';
use 5.008001;
use Lax::DB::Schema;
use Lax::DB;

use parent qw/Amon2/;
# Enable project local mode.
__PACKAGE__->make_local_context();

my $schema = Lax::DB::Schema->instance;

sub db {
    my $c = shift;
    if (!exists $c->{db}) {
        my $conf = $c->config->{DBI}
            or die "Missing configuration about DBI";
        $c->{db} = Lax::DB->new(
            schema       => $schema,
            connect_info => [@$conf],
            on_connect_do => [
                'SET SESSION sql_mode=STRICT_TRANS_TABLES;',
            ],
        );
    }
    $c->{db};
}

1;
__END__

=head1 NAME

Lax - Lax

=head1 DESCRIPTION

This is a main context class for Lax

=head1 AUTHOR

Lax authors.

