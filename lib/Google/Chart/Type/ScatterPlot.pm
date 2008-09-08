# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/lib/Google/Chart/Type/ScatterPlot.pm 72334 2008-09-06T13:00:51.986261Z daisuke  $

package Google::Chart::Type::ScatterPlot;
use Moose;
use constant parameter_value => 's';

with 'Google::Chart::Type::Simple';

__PACKAGE__->meta->make_immutable;

no Moose;

1;

__END__

=head1 NAME 

Google::Chart::Type::ScatterPlot - Google::Chart ScatterPlot Type

=cut
