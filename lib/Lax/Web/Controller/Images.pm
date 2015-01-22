package Lax::Web::Controller::Images;
use warnings;
use strict;

use Lax::Container;
use parent qw/Lax::Web::Controller/;

sub form {
    my ($self, $c) = @_;
    return $c->render('image/form.tt', +{});
}

sub upload {
    my ($self, $c) = @_;
    return $c->render_json( +{
        title => $c->req->parameters->{title},
        message => 'post success',
        size    => length $c->req->parameters->{base64},
#        base64  => $c->req->parameters->{base64},
    });
}

1;

__END__
