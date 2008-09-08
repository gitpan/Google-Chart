# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/lib/Google/Chart/Data.pm 72334 2008-09-06T13:00:51.986261Z daisuke  $

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
