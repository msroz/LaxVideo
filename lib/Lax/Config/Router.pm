package Lax::Config::Router;
use warnings;
use strict;

use Config::ENV 'LAX_ENV';

common {
    index => +{
        action_id  => 'index',
        path       => '/',
        controller => 'Root',
        action     => 'index',
        method     => 'GET',
    },
};

1;

__END__
