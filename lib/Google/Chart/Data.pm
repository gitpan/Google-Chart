# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Data.pm 66683 2008-07-24T05:52:58.814530Z daisuke  $

package Google::Chart::Data;
use Moose::Role;

use constant parameter_name => 'chd';

with 'Google::Chart::QueryComponent::Simple';

has 'dataset' => (
    is => 'rw',
    isa => 'ArrayRef',
    required => 1,
    default => sub { +[] }
);

no Moose;

1;

__END__

=head1 NAME

Google::Chart::Data - Google::Chart Data Role

=cut
