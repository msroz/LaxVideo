package Lax::Web;
use warnings;
use v5.20.1;
use utf8;
use parent qw/Lax Amon2::Web/;
use File::Spec;

use Lax::Util::ENV qw/under_maintenance/;

# dispatcher
use Lax::Web::Dispatcher;
sub dispatch {
    return (Lax::Web::Dispatcher->new->dispatch($_[0]) or die "response is not generated");
}

# load plugins
__PACKAGE__->load_plugins(
    'Web::FillInFormLite',
    'Web::JSON',
    '+Lax::Web::Plugin::Session',
);

# setup view
use Lax::Web::View;
{
    sub create_view {
        my $view = Lax::Web::View->make_instance(__PACKAGE__);
        no warnings 'redefine';
        *Lax::Web::create_view = sub { $view }; # Class cache.
        $view
    }
}

# for your security
__PACKAGE__->add_trigger(
    BEFORE_DISPATCH => sub {
        my ($c) = @_;

        if ( under_maintenance() ) {
            say "UNDER MAINTENANCE"; #TODO: logger
            return $c->res_maintenance;
        }
    },
    AFTER_DISPATCH => sub {
        my ( $c, $res ) = @_;

        # http://blogs.msdn.com/b/ie/archive/2008/07/02/ie8-security-part-v-comprehensive-protection.aspx
        $res->header( 'X-Content-Type-Options' => 'nosniff' );

        # http://blog.mozilla.com/security/2010/09/08/x-frame-options/
        $res->header( 'X-Frame-Options' => 'DENY' );

        # Cache control.
        $res->header( 'Cache-Control' => 'private' );
    },
);

sub res_maintenance {
    my ($c, $tmpl_params) = @_;
    my $res = $c->render('maintenance.tt',$tmpl_params);
    $res->status(503);

    # for SEO.
    # http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.37
    $res->header('Retry-After' => 60 * 60 * 24);
    return $res;
}

1;

__END__
