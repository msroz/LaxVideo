package Lax::Web::Dispatcher;
use v5.20.1;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use Module::Find qw/useall/;

base 'Lax::Web::Controller';
useall 'Lax::Web::Controller';

# root
any '/' => 'Root#index';

1;

__END__
