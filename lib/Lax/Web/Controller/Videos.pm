package Lax::Web::Controller::Videos;
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

    my ($rows, $pager) = $self->model('Video')->collection(
        page  => $page,
        order => $order,
        (sort_by => $sort_by) x !!$sort_by,
    );

    my $tmple_params = +{
        pager => +{
            current  => $pager ? $pager->current_page  : 1,
            next     => $pager ? $pager->next_page     : 0,
            previous => $pager ? $pager->previous_page : 0,
        },
        list => $rows,
    };
    return $c->render('index.tt', $tmple_params);
}

sub index_ajax {
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

    my ($rows, $pager) = $self->model('Video')->collection(
        page  => $page,
        order => $order,
        (sort_by => $sort_by) x !!$sort_by,
    );

    my $videos = $c->render('include/videos.tt', +{ list => $rows });

    return $c->render_json(
        +{
            status    => 1,
            videosHTML => $videos->body,
            pager     => +{
                current  => $pager ? $pager->current_page  : 1,
                next     => $pager ? $pager->next_page     : 0,
                previous => $pager ? $pager->previous_page : 0,
            },
        },
    );
}

sub show {
    my ($self, $c, $matched) = @_;

    my $id = $matched->{id};

    my $row = $self->model('Video')->one(
        id => $id
    );
    my $share_url = sprintf("%s://%s%s",
        $c->req->scheme,
        $c->req->env->{HTTP_HOST},
        $c->req->path_info,
    );
    $self->logger->debugf("share_url = %s", $share_url);
    return $c->render('show.tt', +{ video => $row,  share_url => $share_url });
}

sub about_me {
    my ($self, $c) = @_;

    return $c->render('about_me.tt', +{});
}

1;

__END__
