use strict;
use Test::More (tests => 10);
use Test::Exception;

BEGIN
{
    use_ok("Google::Chart");
}

{ # Pie
    my $chart = Google::Chart->new(
        type => "Pie",
        size => "400x300",
        data => [ 1, 2, 3, 4, 5 ],
    );

    ok( $chart );
    isa_ok( $chart, "Google::Chart" );

    isa_ok( $chart->type, "Google::Chart::Type::Pie" );

    is( $chart->size->width, 400 );
    is( $chart->size->height, 300 );

    my $uri = $chart->as_uri;
    diag $uri;
    my %h = $uri->query_form;
    is( $h{cht}, "p" );
    is( $h{chs}, "400x300" );

    my $filename = 't/foo.png';

    unlink $filename;

    lives_ok { $chart->render_to_file( $filename ) } "render_to_file($filename) should work";

    ok(-f $filename );
}
