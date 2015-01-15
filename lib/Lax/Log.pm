package Lax::Log;
use warnings;
use v5.20.1;

use parent qw/Log::Minimal::Instance/;
use Log::Minimal qw//;
use Lax::Config::Log;

sub new {
    my ($class, %args) = @_;
    my $config = Lax::Config::Log->current || +{};

    $ENV{LM_DEBUG} = 1;
    $ENV{LM_COLOR} = 1;

    return $class->SUPER::new(%{$config}, %args);
}

sub dd {
    my ($self, $args) = @_;
    return Log::Minimal::ddf($args);
}

1;

__END__
