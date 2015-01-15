package Lax::Web::Controller::Root;
use warnings;
use v5.20.1;

use Lax::Container;
use parent qw/Lax::Web::Controller/;

sub index {
    my ($self, $c) = @_;

    my $instance = Lax::Container->instance;
    my $row = $instance->model('Data::Movie')->fetch_by_id(id => 1);

    my $tmple_params = +{
        row => $row ? $row->get_columns : +{},
    };
    return $c->render('index.tt', $tmple_params);
}

1;

__END__
