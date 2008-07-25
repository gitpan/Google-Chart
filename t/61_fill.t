use strict;
use Test::More (tests => 8);
use Test::Exception;

BEGIN
{
    use_ok("Google::Chart");
}

{
    my $chart = Google::Chart->new(
        type => "Line",
        size => "400x300",
        data => [ 1, 2, 3, 4, 5 ],
        fill => {
            module => "LinearGradient",
            args   => {
                target => "bc",
                angle  => 0,
                color  => "ffccff",
            }
        },
    );

    ok( $chart );
    isa_ok( $chart, "Google::Chart" );

    isa_ok( $chart->type, "Google::Chart::Type::Line" );

    is( $chart->size->width, 400 );
    is( $chart->size->height, 300 );

    my $uri = $chart->as_uri;
    diag $uri;
    my %h = $uri->query_form;
    is( $h{cht}, "lc" );
    is( $h{chs}, "400x300" );
}