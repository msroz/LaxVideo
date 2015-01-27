#!/usr/bin/env perl
use warnings;
use strict;

use Text::ASCIITable;
use URI;
use Furl;
use Data::Dumper;
use Lax::Container;
use feature 'say';

my %API_TABLE_MAPPING = (
    name        => 'title',
    uri         => 'uri',
    status      => 'status',
    link        => 'link',
    duration    => 'duration',
    description => 'description',
    width       => 'width',
    height      => 'height',
);

my $AUTH_HEADER   = $ARGV[0];
die '$AUTH_HEADER required' unless $AUTH_HEADER;
my $MIN_PAGE      = $ARGV[1] || 1;
my $MAX_PAGE      = $ARGV[2] || 20;
my $VIMEO_API_URI = 'https://api.vimeo.com/videos';

my $instance = Lax::Container->instance;
my $uri = URI->new($VIMEO_API_URI);

for (my $p = $MIN_PAGE ; $p < $MAX_PAGE ; $p++) {
    say "[start] page:$p";

    $uri->query_form(
        page     => $p,
        per_page => 50,
        query    => 'lacrosse',
        sort     => 'relevant',
    );

    my $furl = Furl->new(
        agent             => __PACKAGE__ . '/1.0',
        timeout           => 120,
        connection_header => 'close',
        headers           => [ Authorization => sprintf("bearer %s", $AUTH_HEADER) ],
    );

    my $res = $furl->get($uri->as_string);
    die $res->status_line unless $res->is_success;
    my $content_hash = $instance->json->decode($res->content);

    say scalar @{ $content_hash->{data} };
    for my $data ( @{ $content_hash->{data} } ) {
        my $record = {};

        #my $t = Text::ASCIITable->new(+{ headingText => "Vimeo API Result" });
        #$t->setCols(qw/key value/);

        for my $key (keys %{$data}) {
            unless (ref $data->{$key}) {
                my $column = $API_TABLE_MAPPING{$key};
                next unless $column;

                if ($key eq 'uri') {
                    my ($a, $b, $video_id) = split q{/}, $data->{uri};
                    #$t->addRow('video_id', $video_id);
                    $record->{video_id} = $video_id;
                }
                elsif ($key eq 'status') {
                    my $status = $data->{$key} eq 'available' ? 0 : 1;
                    #$t->addRow('status', $status);
                    $record->{status} = $status;
                    next;
                }
                else {
                    #$t->addRow($column, $data->{$key});
                    $record->{$column} = $data->{$key};
                }
            }
            elsif ($key eq 'pictures') {
                if (my $picture = ${$data->{pictures}{sizes}}[0]->{link}) {
                    #$t->addRow("picture", $picture);
                    $record->{picture} = $picture;
                }
            }
            $record->{created_at} = time;
            $record->{updated_at} = time;
        }
        #say $t;

        my $id = eval { $instance->model('Data::Video')->insert($record); };
        if (my $e = $@) {
            say "[duplicate] $record->{video_id}";
        }
        say "[inserted] id: $id" if ($id);
    }
    sleep(2);
    say 'sleep(2)';
}

__END__

USAGE:
    perl -Ilib script/tool/insert_vimeo_from_api.pl <OAUTH_TOKEN>

SEE ALSO:
    https://developer.vimeo.com/api/authentication#authenticated-requests

