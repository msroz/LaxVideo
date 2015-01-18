package Lax::Model::Data::Video;
use warnings;
use strict;

use parent qw/Lax::Model/;
use Sub::Args;

sub fetch_by_id {
    my $self = shift;
    my $args = args(+{ id => 1 }, @_);

    my $row = $self->db->single('videos', +{ id => $args->{id} });
    return $row;
}

sub search {
    my $self = shift;
    my $args = args(
        +{
            page   => 1,
            limit  => 1,
            status => 0,
        }, @_
    );

    my ($rows, $pager) = $self->db->search_with_pager(
        'videos',
        [ status => 0 ],
        {
            order_by => { id => 'desc' },
            page => $args->{page},
            rows => $args->{limit},
        },
    );

    return ($rows, $pager);
}
sub insert {}
sub update {}

1;

__END__
