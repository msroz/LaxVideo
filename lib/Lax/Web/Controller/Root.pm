package Lax::Web::Controller::Root;
use warnings;
use strict;

use Lax::Container;
use parent qw/Lax::Web::Controller/;

sub index {
    my ($self, $c, $matched) = @_;

    my $v = $self->form_validator($c);
    my $res = $v->check(
        page    => [qw/UINT/],
        order   => [qw//],
        sort_by => [qw//],
    );
    if ($v->has_error) {
        return $c->res_404; # TODO: res_400 bad request
    }
    my $page    = $res->query->param('page')    || 1;
    my $order   = $res->query->param('order')   || 'desc';
    my $sort_by = $res->query->param('sort_by');

    my $rows = $self->model('Video')->collection(
        page  => $page,
        order => $order,
        (sort_by => $sort_by) x !!$sort_by,
    );

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
