use strict;
use Test::More (tests => 5);
use Test::Exception;

BEGIN
{
    use_ok("Google::Chart::Data::Text");
}

{
    my $data = Google::Chart::Data::Text->new([ 1.0, 1.2, 1.3, 50, 100 ]);

    ok($data);
    isa_ok($data, "Google::Chart::Data::Text");
    my $query = $data->as_query;
    diag($query);
    is( $query, "chd=t%3A1.0%2C1.2%2C1.3%2C50.0%2C100.0" );
}

{
    dies_ok { Google::Chart::Data::Text->new([ 'A' ]) } "bad args"
}