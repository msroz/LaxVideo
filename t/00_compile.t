use warnings;
use strict;
use Test::LoadAllModules;

BEGIN {
    local $ENV{LAX_ENV} = 'testing';
    all_uses_ok( search_path => 'Lax' );
}
