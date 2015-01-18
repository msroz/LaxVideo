package Lax::Web::Controller::Info;
use warnings;
use strict;

use Lax::Container;
use parent qw/Lax::Web::Controller/;

sub about_me {
    my ($self, $c) = @_;

    return $c->render('about_me.tt', +{});
}

1;

__END__
