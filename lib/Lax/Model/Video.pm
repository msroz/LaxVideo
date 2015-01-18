package Lax::Model::Video;
use warnings;
use strict;

use parent qw/Lax::Model/;
use Sub::Args;

sub collection {
    my $self = shift;
    my $args = args(
        +{
            page    => 1,
            sort_by => 0,
            order   => 0,
        }, @_
    );

    my $rows = $self->model('Data::Video')->search();
    return [] unless @{$rows};

    return [ map { $_->get_columns } @{$rows} ];
}

1;

__END__
