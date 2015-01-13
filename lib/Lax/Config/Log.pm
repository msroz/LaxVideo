package Lax::Config::Log;
use warnings;
use v5.20.1;

use Config::ENV 'LAX_ENV';
use Path::Tiny qw/path/;

config common => {
    log_base_dir => path('./log')->absolute . '/',
};

1;

__END__

