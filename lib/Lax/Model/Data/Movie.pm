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

sub search {
    my $self = shift;
    my $args = args(
        +{
            limit  => 0,
            offset => 0,
            status => 0,
        }, @_
    );

    my $iter = $self->db->search(
        'movies',
        [ status => 0 ],
        {
            order_by => { id => 'desc' },
        },
    );

    return [ $iter->all ];
}
sub insert {}
sub update {}

1;

__END__
