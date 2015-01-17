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
    about_me => +{
        action_id  => 'about_me',
        path       => '/me',
        controller => 'Root',
        action     => 'about_me',
        method     => 'GET',
    },
};

1;

__END__
