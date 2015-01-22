package Lax::Config::Router;
use warnings;
use strict;

use Config::ENV 'LAX_ENV';

common {
    index => +{
        action_id  => 'index',
        path       => '/',
        controller => 'Videos',
        action     => 'index',
        method     => 'GET',
    },
    show_videos => +{
        action_id  => 'show_videos',
        path       => '/videos',
        controller => 'Videos',
        action     => 'index',
        method     => 'GET',
    },
    show_videos_ajax => +{
        action_id  => 'show_videos_ajax',
        path       => '/videos_ajax',
        controller => 'Videos',
        action     => 'index_ajax',
        method     => 'GET',
    },
    show_video => +{
        action_id  => 'show_video',
        path       => '/videos/{id:\d+}',
        controller => 'Videos',
        action     => 'show',
        method     => 'GET',
    },
    about_me => +{
        action_id  => 'about_me',
        path       => '/me',
        controller => 'Info',
        action     => 'about_me',
        method     => 'GET',
    },
    form_image => +{
        action_id  => 'form_image',
        path       => '/image/new',
        controller => 'Images',
        action     => 'form',
        method     => 'GET',
    },
    upload_image => +{
        action_id  => 'upload_image',
        path       => '/image/upload',
        controller => 'Images',
        action     => 'upload',
        method     => 'POST',
    },
};

1;

__END__
