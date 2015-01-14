package Lax::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use Lax::Container;

any '/' => sub {
    my ($c) = @_;
    my $counter = $c->session->get('counter') || 0;
    $counter++;
    $c->session->set('counter' => $counter);

    my $instance = Lax::Container->instance;
    my $row = $instance->model('Data::Movie')->fetch_by_id(id => 1);

    return $c->render('index.tt', {
        counter => $counter,
        row     => $row ? $row->get_columns : +{},
    });
};

post '/reset_counter' => sub {
    my $c = shift;
    $c->session->remove('counter');
    return $c->redirect('/');
};

post '/account/logout' => sub {
    my ($c) = @_;
    $c->session->expire();
    return $c->redirect('/');
};

1;
