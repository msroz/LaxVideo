use Test::More;

use Lax::Container;
use Lax::Model;

subtest 'basic' => sub {
    my $model = Lax::Model->new;
    isa_ok $model, 'Lax::Model';
};

done_testing;


