# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Fill.pm 66687 2008-07-24T06:18:24.102192Z daisuke  $

package Google::Chart::Fill;
use Moose::Role;

use constant parameter_name => 'chf';

with 'Google::Chart::QueryComponent::Simple';

no Moose;

1;