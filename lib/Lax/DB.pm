package Lax::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

use Lax::Config::DB;

__PACKAGE__->load_plugin('Pager');

sub new {
    my ($class, %args) = @_;
    my $config = Lax::Config::DB->current or die 'no db config';
    return $class->SUPER::new(%{$config}, %args);
}

1;
__END__
