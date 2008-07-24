# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Type/Simple.pm 66683 2008-07-24T05:52:58.814530Z daisuke  $

package Google::Chart::Type::Simple;
use Moose::Role;

with 'Google::Chart::QueryComponent::Simple';
with 'Google::Chart::Type';

no Moose;

sub parameter_name { 'cht' }
sub parameter_value { '' }

1;