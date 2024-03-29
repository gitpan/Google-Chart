use strict;
use Test::More (tests => 4);


BEGIN {
    use_ok("Google::Chart");
}

note "LWP::UserAgent: $LWP::UserAgent::VERSION\n";

{
    # self note: LWP::UserAgent 5.819 allowed $ENV{HTTP_PROXY} = '',
    # but I got a failure report for LWP::UserAgent 5.821

    local %ENV;
    my $g = Google::Chart->create(
        Line => ( width => 100, height => 200 )
    );
    ok(! $g->ua->proxy('http'), "http proxy should not be set");
}

{
    local %ENV;
    $ENV{HTTP_PROXY} = 'http://localhost:3128';
    my $g = Google::Chart->create(
        Line => ( width => 100, height => 200 )
    );
    is($g->ua->proxy('http'), $ENV{HTTP_PROXY}, "http proxy should be set");
}

{
    local %ENV;
    $ENV{HTTP_PROXY} = 'http://localhost:3128';
    $ENV{GOOGLE_CHART_ENV_PROXY} = 0;
    my $g = Google::Chart->create(
        Line => ( width => 100, height => 200 )
    );
    ok(! $g->ua->proxy('http'), "http proxy should not be set");
}

