package Lax::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

use Sub::Args;

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub get_by_id {
    my $self = shift;
    my $args = args(+{ id => 1 }, @_);

    my $row = $self->single('movies', +{ id => $args->{id} });

    return $row;
}

1;
__END__
