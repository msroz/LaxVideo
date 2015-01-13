package Lax::Base;
use warnings;
use v5.20.1;

use parent 'Class::Accessor::Lite';

sub new {
    my $class = shift;
    my $self = bless {
        @_ == 1 && ref $_[0] eq 'HASH' ? %{$_[0]} : @_,
    }, $class;

    if ($self->can('init')) {
        $self->init;
    }

    return $self;
}

1;
__END__

