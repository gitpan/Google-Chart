use strict;
use lib "t/lib";
use Test::More (tests => 11);
use Test::Google::Chart qw(test_render);

use_ok "Google::Chart::Type::Bar";

{ # Bar
    my $chart = Google::Chart->create(
        Bar => (
            size => "400x300",
            bar_width => 10,
            bar_space => 20,
            group_space => 5,
        )
    );
    $chart->add_dataset(
        data => [ 1, 2, 3, 4, 5 ],
    );

    ok( $chart );
    isa_ok( $chart, "Google::Chart" );

    is( $chart->width, 400 );
    is( $chart->height, 300 );

    my $uri = $chart->as_uri;
    note $uri;
    my %h = $uri->query_form;
    is( $h{cht}, "bvg" );
    is( $h{chs}, "400x300" );
    is( $h{chbh}, "10,20,5");

    test_render( $chart );
}

