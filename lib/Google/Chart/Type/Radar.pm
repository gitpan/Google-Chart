# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Type/Radar.pm 66683 2008-07-24T05:52:58.814530Z daisuke  $

package Google::Chart::Type::Radar;
use Moose;
use constant parameter_value => 'r';

with 'Google::Chart::Type::Simple';

__PACKAGE__->meta->make_immutable;

no Moose;

1;