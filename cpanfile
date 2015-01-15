# default module made by amon2-setup.pl
requires 'Amon2', '6.10';
requires 'Crypt::CBC';
requires 'Crypt::Rijndael';
requires 'DBD::SQLite', '1.33';
requires 'HTML::FillInForm::Lite', '1.11';
requires 'HTTP::Session2', '1.03';
requires 'JSON', '2.50';
requires 'Module::Functions', '2';
requires 'Plack::Middleware::ReverseProxy', '0.09';
requires 'Router::Boom', '0.06';
requires 'Starlet', '0.20';
requires 'Teng', '0.18';
requires 'Test::WWW::Mechanize::PSGI';
requires 'Text::Xslate', '2.0009';
requires 'Text::Xslate::Bridge::TT2Like';
requires 'Time::Piece', '1.20';
requires 'perl', '5.010_001';


# added module for Lax
requires 'Log::Minimal::Instance';
requires 'Log::Minimal';
requires 'Config::ENV';
requires 'Path::Tiny';
requires 'Micro::Container';
requires 'Class::Accessor::Lite';
requires 'Sub::Args';
requires 'Class::Load';

on configure => sub {
    # default module made by amon2-setup.pl
    requires 'Module::Build', '0.38';
    requires 'Module::CPANfile', '0.9010';
};

on test => sub {
    # default module made by amon2-setup.pl
    requires 'Test::More', '0.98';

    # added module for Lax
    requires 'Test::Pretty','== 0.30';
    requires 'Test::Name::FromLine',        '== 0.13';
    requires 'Test::MockTime',              '== 0.13';
    requires 'Test::LoadAllModules',        '== 0.022';
    requires 'Test::Deep',                  '== 0.113';
    requires 'Test::Deep::Matcher',         '== 0.01';
    requires 'Test::MockObject::Extends';
    requires 'Test::Exception';
    requires 'Harriet',                     '== 0.04';
    requires 'Devel::Cover',                '== 1.17';
};
