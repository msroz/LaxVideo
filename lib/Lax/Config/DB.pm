package Lax::Config::DB;
use warnings;
use strict;

use Config::ENV 'LAX_ENV';

# TODO
use Lax::DB::Schema;

common {
    schema => Lax::DB::Schema->instance,
    connect_info => [
        sprintf("dbi:mysql:dbname=%s;host=%s", $ENV{LAX_DB_NAME} || 'lax', $ENV{LAX_DB_HOST} || 'localhost'),
        $ENV{LAX_DB_USER} || 'lax',
        $ENV{LAX_DB_PW}   || '',
        +{ mysql_enable_utf8 => 1 },
    ],
    on_connect_do => [
        'SET SESSION sql_mode=STRICT_TRANS_TABLES;',
    ],
};

1;

__END__
