use Test::More;
use Lax::Container;
use Lax::Model::Video;

subtest 'basic' => sub {
    my $model = Lax::Model::Video->new;
    isa_ok $model, 'Lax::Model::Video';
};

done_testing;

