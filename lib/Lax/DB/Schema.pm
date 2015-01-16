package Lax::DB::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;
table {
    name 'videos';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'status', type => 4},
        {name => 'video_id', type => 4},
        {name => 'title', type => 12},
        {name => 'description', type => 12},
        {name => 'link', type => 12},
        {name => 'width', type => 4},
        {name => 'height', type => 4},
        {name => 'picture', type => 12},
        {name => 'duration', type => 4},
        {name => 'score', type => 4},
        {name => 'like', type => 4},
        {name => 'dislike', type => 4},
        {name => 'created_at', type => 4},
        {name => 'updated_at', type => 4},
    );
};

1;

