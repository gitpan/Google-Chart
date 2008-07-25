# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Type/ScatterPlot.pm 66700 2008-07-24T09:37:48.241728Z daisuke  $

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
