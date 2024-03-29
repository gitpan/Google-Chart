
package Google::Chart::Type::Line;
use Moose;
use namespace::clean -except => qw(meta);

extends 'Google::Chart';
with qw(
    Google::Chart::WithAxis
    Google::Chart::WithData 
    Google::Chart::WithGrid
    Google::Chart::WithLinearGradientFill
    Google::Chart::WithLinearStripe
    Google::Chart::WithLineStyle
    Google::Chart::WithLineDrawStyle
    Google::Chart::WithMarker
    Google::Chart::WithRangeFill
    Google::Chart::WithRangeMarker
    Google::Chart::WithSolidFill
);

sub _build_type {
    return 'lc';
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

Google::Chart::Type::Line - Google::Chart Line Type

=cut