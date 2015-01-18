package Lax::Container;
use warnings;
use strict;
use feature 'state';

use parent qw/Micro::Container/;
use JSON::XS;

__PACKAGE__->register(
    'Lax::Log'                => [],
    'Lax::DB'                 => [],
    'JSON::XS'                => sub {
        return JSON::XS->new->utf8
    },
    'Lax::Model::Video'       => [],
    'Lax::Model::Data::Video' => [],
);

sub logger { state $cache = shift->get('Lax::Log') }
sub db     { state $cache = shift->get('Lax::DB')  }
sub json   { state $cache = shift->get('JSON::XS') }
sub model {
    my ($self, $name) = @_;
    state $model = +{};
    $model->{$name} ||= $self->get('Lax::Model::' . $name);
}
1;

__END__
