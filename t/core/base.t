use Test::More;

use Lax::Root;

subtest 'basic' => sub {
    my $instance = Lax::Root->new;
    isa_ok $instance, 'Lax::Root';
};

done_testing;

