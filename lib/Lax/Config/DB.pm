package Lax::Config::DB;
use warnings;
use v5.20.1;

use Config::ENV 'LAX_ENV';

# TODO
use Lax::DB::Schema;

common {
    schema => Lax::DB::Schema->instance,
    connect_info => [
        "dbi:mysql:dbname=lax", 'lax', '',
        +{ mysql_enable_utf8 => 1 },
    ],
    on_connect_do => [
        'SET SESSION sql_mode=STRICT_TRANS_TABLES;',
    ],
};

1;

__END__
