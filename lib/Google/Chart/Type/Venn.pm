# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/lib/Google/Chart/Type/Venn.pm 72334 2008-09-06T13:00:51.986261Z daisuke  $

package Google::Chart::Type::Venn;
use Moose;

use constant parameter_value => 'v';

with 'Google::Chart::Type::Simple';

__PACKAGE__->meta->make_immutable;

no Moose;

1;

__END__

=head1 NAME 

Google::Chart::Type::Venn - Google::Chart Venn Type

=cut