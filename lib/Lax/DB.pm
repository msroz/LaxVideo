package Lax::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

use Lax::Config::DB;
use Sub::Args;

__PACKAGE__->load_plugin('Pager');

sub new {
    my ($class, %args) = @_;
    my $config = Lax::Config::DB->current or die 'no db config';
    return $class->SUPER::new(%{$config}, %args);
}

sub get_by_id {
    my $self = shift;
    my $args = args(+{ id => 1 }, @_);

    my $row = $self->single('movies', +{ id => $args->{id} });

    return $row;
}

1;
__END__
