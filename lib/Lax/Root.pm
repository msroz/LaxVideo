package Lax::Root;
use warnings;
use strict;
use feature 'state';

use parent qw/Lax::Base/;
use Lax::Container;

sub container { state $cache = Lax::Container->instance; }
sub logger    { shift->container->logger }
sub db        { shift->container->db }

1;

__END__
