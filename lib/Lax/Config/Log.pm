package Lax::Config::Log;
use warnings;
use strict;

use Config::ENV 'LAX_ENV';
use Path::Tiny qw/path/;

common {
    base_dir => path('./log')->absolute . '/',
    level    => 'DEBUG',
    pattern  => undef, # print stderr
};

1;

__END__

