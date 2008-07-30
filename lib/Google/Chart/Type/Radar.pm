# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/lib/Google/Chart/Type/Radar.pm 67466 2008-07-30T01:53:50.528367Z daisuke  $

package Google::Chart::Type::Radar;
use Moose;
use constant parameter_value => 'r';

with 'Google::Chart::Type::Simple';

__PACKAGE__->meta->make_immutable;

no Moose;

1;

__END__

=head1 NAME 

Google::Chart::Type::Radar - Google::Chart Radar Type

=cut

