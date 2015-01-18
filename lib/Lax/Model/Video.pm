package Lax::Model::Video;
use warnings;
use strict;

use parent qw/Lax::Model/;
use Sub::Args;

sub collection {
    my $self = shift;
    my $args = args(
        +{
            sort_by => 0,
            order   => 0,
        }, @_
    );

    my $rows = $self->model('Data::Video')->search();
    return [] unless @{$rows};

    my $sort_by = $args->{sort_by};
    my $order   = $args->{order};
    return [ map { $_->get_columns } @{$rows} ] unless($sort_by && $order);

    my @row;
    if ($sort_by eq 'created_at') {
        @row = order_by_created_at(videos => $rows, order => $order);
    }
    elsif($sort_by eq 'duraton') {
        @row = order_by_duration(videos => $rows, order => $order);
    }
    elsif($sort_by eq 'like') {
        @row = order_by_like(videos => $rows, order => $order);
    }
    else {
        die "unknown sort_by: $sort_by";
    }

}

sub order_by_created_at {
    my $self = shift;
    my $args = args(+{ videos => 1, order => 1 }, @_);

    my @rows;
    if ($args->{order} eq 'asc') {
        @rows =
            map { $_->[1] } sort { $a->[0] <=> $b->[0] } map { [ $_->created_at, $_ ] } @{$args->{videos}};
    }
    elsif ($args->{order} eq 'desc') {
        @rows =
            map { $_->[1] } sort { $b->[0] <=> $a->[0] } map { [ $_->created_at, $_ ] } @{$args->{videos}};
    }
    else {
        die "unknown order: $args->{order}";
    }
    return \@rows;
}

sub order_by_duration {
    my $self = shift;
    my $args = args(+{ videos => 1, order => 1 }, @_);

    my @rows;
    if ($args->{order} eq 'asc') {
        @rows =
            map { $_->[1] } sort { $a->[0] <=> $b->[0] } map { [ $_->duration, $_ ] } @{$args->{videos}};
    }
    elsif ($args->{order} eq 'desc') {
        @rows =
            map { $_->[1] } sort { $b->[0] <=> $a->[0] } map { [ $_->duration, $_ ] } @{$args->{videos}};
    }
    else {
        die "unknown order: $args->{order}";
    }
    return \@rows;
}

sub order_by_like {
    my $self = shift;
    my $args = args(+{ videos => 1, order => 1 }, @_);

    my @rows;
    if ($args->{order} eq 'asc') {
        @rows =
            map { $_->[1] } sort { $a->[0] <=> $b->[0] } map { [ $_->like, $_ ] } @{$args->{videos}};
    }
    elsif ($args->{order} eq 'desc') {
        @rows =
            map { $_->[1] } sort { $b->[0] <=> $a->[0] } map { [ $_->like, $_ ] } @{$args->{videos}};
    }
    else {
        die "unknown order: $args->{order}";
    }
    return \@rows;
}

1;

__END__
