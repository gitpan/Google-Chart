# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Fill/Solid.pm 66687 2008-07-24T06:18:24.102192Z daisuke  $

package Google::Chart::Fill::Solid;
use Moose;
use Moose::Util::TypeConstraints;
use Google::Chart::Types;

with 'Google::Chart::Fill';

has 'color' => (
    is => 'rw',
    isa => 'Google::Chart::Color',
    required => 1,
);

has 'target' => (
    is => 'rw',
    isa => enum([ qw(bg c a) ]),
    required => 1
);

__PACKAGE__->meta->make_immutable;

no Moose;

sub parameter_value {
    my $self = shift;
    return join($self->target, 's', $self->color)
}

1;