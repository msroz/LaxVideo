package Lax::Web::Controller::Root;
use warnings;
use strict;

use Lax::Container;
use parent qw/Lax::Web::Controller/;

sub index {
    my ($self, $c, $matched) = @_;

    my $v = $self->form_validator($c);
    $v->check(
        page    => [qw/UINT/],
        order   => [qw//],
        sort_by => [qw//],
    );

    my $rows = $self->model('Video')->collection();

    my $tmple_params = +{
        list => $rows,
    };
    return $c->render('index.tt', $tmple_params);
}

sub about_me {
    my ($self, $c) = @_;

    return $c->render('about_me.tt', +{});
}

1;

__END__
