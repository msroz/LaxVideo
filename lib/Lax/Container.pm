package Lax::Container;
use warnings;
use v5.20.1;

use parent qw/Micro::Container/;

__PACKAGE__->register(
    'Lax::Log' => [],
    'Lax::DB'  => [],
);

sub logger { state $cache = shift->get('Lax::Log') }
sub db     { state $cache = shift->get('Lax::DB')  }

sub model {
    my ($self, $name) = @_;
    state $model = +{};
    $model->{$name} ||= $self->get('Lax::Model::' . $name);
}
1;

__END__
