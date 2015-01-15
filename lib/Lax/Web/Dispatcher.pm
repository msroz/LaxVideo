package Lax::Web::Dispatcher;
use v5.20.1;
use warnings;

use Router::Simple;
use Lax::Util;
use Lax::Config::Router;

use parent qw/Lax::Root/;

__PACKAGE__->mk_accessors(qw/
    router
    router_config
/);

my %CLASS_LOADED;

sub new {
    my ($class, %args) = @_;
    my $config = Lax::Config::Router->current or die 'no router config';
    my $router = Router::Simple->new;

    for my $action_id (keys %{$config}) {
        my $routing = $config->{$action_id};
        next unless exists $routing->{action_id};

        $router->connect($routing->{path}, $routing, +{ method => $routing->{method} });
    }
    my $self = bless +{
        router        => $router,
        router_config => $config,
    }, $class;

    return $self;
}

sub dispatch {
    my ($self, $c) = @_;
    my $req = $c->request;

    if (my $matched = $self->router->match($req->env)) {
        $self->logger->debugf("[Router Matched] %s", $self->logger->dd($matched));

        my $controller = sprintf 'Lax::Web::Controller::%s', $matched->{controller};
        my $action     = $matched->{action};

        $CLASS_LOADED{$controller} //= do {
            Lax::Util::load_class($controller);
            $controller;
        };

        $c->{args} = $matched;
        return $controller->new->$action($c, $matched);
    }
    else {
        return $c->res_404;
    }
}

1;

__END__

https://github.com/kentaro/amon2-example/blob/master/lib/MyApp/Router.pm#L12
http://blog.kentarok.org/entry/2012/02/10/015245
