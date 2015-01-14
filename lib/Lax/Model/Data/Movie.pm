package Lax::Model::Data::Movie;
use warnings;
use v5.20.1;

use parent qw/Lax::Model/;
use Sub::Args;

sub fetch_by_id {
    my $self = shift;
    my $args = args(+{ id => 1 }, @_);

    my $row = $self->db->single('movies', +{ id => $args->{id} });
    return $row;
}

sub search {}
sub insert {}
sub update {}

1;

__END__
