# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/lib/Google/Chart/Fill.pm 67926 2008-08-06T04:40:02.039865Z daisuke  $

package Google::Chart::Fill;
use Moose::Role;

use constant parameter_name => 'chf';

with 'Google::Chart::QueryComponent::Simple';

no Moose;

1;

__END__

=head1 NAME

Google::Chart::Fill - Base Fill Role

=head1 SYNOPSIS

  package NewFillType;
  use Moose;

  with 'Google::Chart::Fill';

  no Moose;

  sub parameter_value { ... }

=cut