use Test::More;

use Lax::Root;

my $cases = +{
    container => 'Lax::Container',
    logger    => 'Lax::Log',
    db        => 'Lax::DB',
    model     => 'Lax::Model::Video',
};

subtest 'basic' => sub {
    my $root = Lax::Root->new;
    isa_ok $root, 'Lax::Root';
    for my $method (keys %{$cases}) {
        can_ok $root, $method;
        if ($method eq 'model') {
            my $instance = $root->$method('Video');
            isa_ok $instance, $cases->{$method};
        }
        else {
            my $instance = $root->$method();
            isa_ok $instance, $cases->{$method};
        }
    }
};


done_testing;

