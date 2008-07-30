# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/lib/Google/Chart/Type/SparkLine.pm 67466 2008-07-30T01:53:50.528367Z daisuke  $

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