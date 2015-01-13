package Lax::Container;
use warnings;
use v5.20.1;

use parent qw/Micro::Container/;

my $container_config_map = +{
    'Lax::Log' => 'Lax::Config::Log',
};

sub init {
    my ($class) = @_;

    for my $name (keys %{$container_config_map}) {
        my $config = $container_config_map->{$name}->current || +{};
        __PACKAGE__->register($name, $config);
    }
    for my $name (%{$container_config_map}) {
        my $instance = __PACKAGE__->get($name);
        if ($instance->can('init')) {
            $instance->init;
        }
    }
}

1;

__END__
