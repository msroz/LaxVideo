package Lax::Config::Log;
use warnings;
use v5.20.1;

use Config::ENV 'LAX_ENV';
use Path::Tiny qw/path/;

common {
    base_dir => path('./log')->absolute . '/',
    pattern  => undef, # print stderr
};

1;

__END__

