# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Type/Venn.pm 66683 2008-07-24T05:52:58.814530Z daisuke  $

package Google::Chart::Type::Venn;
use Moose;

use constant parameter_value => 'v';

with 'Google::Chart::Type::Simple';

__PACKAGE__->meta->make_immutable;

no Moose;

1;