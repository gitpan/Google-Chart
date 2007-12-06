#!/usr/bin/env perl

use warnings;
use strict;
use Google::Chart;
use Test::More tests => 2;

my $chart = Google::Chart->new(
    type_name => 'type_pie_3d',
    set_size  => [ 300, 100 ],
    data_spec => {
        encoding  => 'data_simple_encoding',
        max_value => 100,
        value_sets => [ [ map { $_ * 10 } 0..10 ] ],
    },
);

is(
    $chart->get_url,
    'http://chart.apis.google.com/chart?chs=300x100&chd=s:AGMSYekqw29&cht=p3',
    'basic 3d pie chart',
);

$chart->type_name('type_line');

is(
    $chart->get_url,
    'http://chart.apis.google.com/chart?chs=300x100&chd=s:AGMSYekqw29&cht=lc',
    'basic line chart',
);

