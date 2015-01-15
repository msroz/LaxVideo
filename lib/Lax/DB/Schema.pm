package Lax::DB::Schema;
use v5.20.1;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'Lax::DB::Row';

table {
    name 'movies';
    pk 'id';
    columns qw(
        id
        status
        title
        url
        youtube_id
        score
        like
        dislike
        created_at
        updated_at
    );
};

1;
