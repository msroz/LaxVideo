package Lax::Web;
use warnings;
use strict;
use utf8;
use parent qw/Lax Lax::Root Amon2::Web/;
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
        $res->header( 'Cache-Control' => 'no-cache' );
        $res->header( 'Pragma'        => 'no-cache' );
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

sub want_json {
    my ($self) = @_;
    my $accept = $self->req->header('Accept') || '';
    $accept =~ m|^application/json| ? 1 : 0;
}

sub render_json {
    my ($self, $stuff) = @_;

    # for IE7 JSON venularity.
    # see http://www.atmarkit.co.jp/fcoding/articles/webapp/05/webapp05a.html
    my %_ESCAPE = (
        '+' => '\\u002b', # do not eval as UTF-7
        '<' => '\\u003c', # do not eval as HTML
        '>' => '\\u003e', # ditto.
    );

    my $output = $self->json->encode($stuff);
    $output =~ s!([+<>])!$_ESCAPE{$1}!g;
    my $res = $self->create_response(200);
    $res->content_type("application/json; charset=UTF-8");
    $res->header( 'X-Content-Type-Options' => 'nosniff' ); # defense from XSS
    $res->content_length(length($output));
    $res->body($output);
    return $res;
}

1;

__END__
