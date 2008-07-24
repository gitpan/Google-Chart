# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Type/SparkLine.pm 66683 2008-07-24T05:52:58.814530Z daisuke  $

package Google::Chart::Type::SparkLine;
use Moose;

use constant parameter_value => 'ls';

with 'Google::Chart::Type::Simple';

__PACKAGE__->meta->make_immutable;

no Moose;

1;

__END__

=head1 NAME

Google::Chart::Type::SparkLine - Google::Chart SparkLine Type

=cut