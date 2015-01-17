package Lax::Web::Controller::Root;
use warnings;
use strict;

use Lax::Container;
use parent qw/Lax::Web::Controller/;

sub index {
    my ($self, $c) = @_;

    my $instance = Lax::Container->instance;
    my $row = $instance->model('Data::Video')->fetch_by_id(id => 1);
    my $rows = $instance->model('Data::Video')->search();

    my $tmple_params = +{
        row  => $row ? $row->get_columns : +{},
        list => $rows,
    };
    return $c->render('index.tt', $tmple_params);
}

1;

__END__
