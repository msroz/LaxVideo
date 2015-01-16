#!/usr/bin/env perl
use warnings;
use v5.20.1;

use JSON::Parse qw/json_file_to_perl/;
use Data::Dumper;
use Lax::Container;

my $instance = Lax::Container->instance;

my @fields = qw/
    uri
    name
    description
    link
    duration
    width
    height
/;

my $p = json_file_to_perl('file/vimeo_search_for_lacrosse.json');

my $videos = [];
for my $item (@{$p->{data}}) {
    say "===========";
    my $video = +{};
    for my $field (@fields) {
        if ($field eq 'name') {
            $video->{title} = $item->{name};
        }
        elsif ($field eq 'uri') {
            my ($a, $b, $video_id) = split q{/}, $item->{$field};
            $video->{video_id} = $video_id;
        }
        else {
            $video->{$field} = $item->{$field};
        }
    }
    $video->{picture} = ${$item->{pictures}{sizes}}[0]->{link};
    $video->{updated_at} = time;
    $video->{created_at} = time;

    push @{$videos}, $video;
}

say Dumper $videos;
say scalar @{$videos};

my $res = $instance->model('Data::Video')->db->bulk_insert(
    'videos',
    $videos,
);

say "res:$res";
