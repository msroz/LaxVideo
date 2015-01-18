package Lax::Web::Controller;
use warnings;
use strict;

use parent qw/Lax::Root/;
use FormValidator::Lite;

sub form_validator {
    my ($self, $c) = @_;
    return FormValidator::Lite->new($c->req->parameters->as_hashref);
}

1;

__END__

