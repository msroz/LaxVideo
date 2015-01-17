package Lax::Util::ENV;
use warnings;
use strict;

use parent qw/Exporter/;
our @EXPORT_OK = qw/
    under_maintenance
    is_development
    is_test
    is_production
/;

sub under_maintenance { !!$ENV{LAX_MAINTENANCE}; }
sub is_development    { !!( ( $ENV{LAX_ENV} || '' ) eq 'development') }
sub is_test           { !!( ( $ENV{LAX_ENV} || '' ) eq 'test')        }
sub is_production     { !!( ( $ENV{LAX_ENV} || '' ) eq 'production')  }

1;

__END__
