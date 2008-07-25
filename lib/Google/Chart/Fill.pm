# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Fill.pm 66700 2008-07-24T09:37:48.241728Z daisuke  $

package Google::Chart::Fill;
use Moose::Role;

use constant parameter_name => 'chf';

with 'Google::Chart::QueryComponent::Simple';

no Moose;

1;

__END__

=head1 NAME

Google::Chart::Fill - Base Fill Role

=cut