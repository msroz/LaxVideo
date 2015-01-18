package Lax::Model::Video;
use warnings;
use strict;

use parent qw/Lax::Model/;
use Sub::Args;

sub ENTRIES_PER_PAGE { 5 }

sub collection {
    my $self = shift;
    my $args = args(
        +{
            page    => 1,
            sort_by => 0,
            order   => 0,
        }, @_
    );

    my ($rows, $pager) = $self->model('Data::Video')->search(
        page  => $args->{page},
        limit => $self->ENTRIES_PER_PAGE,
    );
    return ([], undef) unless @{$rows};

    return ([ map { $_->get_columns } @{$rows} ], $pager);
}

sub one {
    my $self = shift;
    my $args = args(+{ id => 1 }, @_);

    my $row = $self->model('Data::Video')->fetch_by_id(id => $args->{id});

    return undef unless $row;
    return $row->get_columns;
}

1;

__END__
