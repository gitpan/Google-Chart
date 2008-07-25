# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Type/Simple.pm 66700 2008-07-24T09:37:48.241728Z daisuke  $

package Google::Chart::Type::Simple;
use Moose::Role;

with 'Google::Chart::QueryComponent::Simple';
with 'Google::Chart::Type';

no Moose;

sub parameter_name { 'cht' }
sub parameter_value { '' }

1;

__END__

=head1 NAME

Google::Chart::Type::Simple - Role For Simple Types

=head1 METHODS

=head2 parameter_name

Returns 'cht'

=head2 parameter_value

You should return the appropriate encoded value 

=cut