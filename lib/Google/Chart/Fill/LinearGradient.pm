# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Fill/LinearGradient.pm 66687 2008-07-24T06:18:24.102192Z daisuke  $

package Google::Chart::Fill::LinearGradient;
use Moose;
use Moose::Util::TypeConstraints;
use Google::Chart::Types;

subtype 'Google::Chart::Fill::LinearGradient::Angle'
    => as 'Num'
    => where { $_ >= 0 && $_ <= 90 }
    => message { "Angle spec must be between 0 and 90" }
;

subtype 'Google::Chart::Fill::LinearGradient::Offset'
    => as 'Num'
    => where { $_ >= 0 && $_ <= 1 }
    => message { "Offset spec must be between 0 and 1" }
;

has 'target' => (
    is => 'rw',
    isa => enum([ qw(bc c) ]),
    required => 1,
);

has 'angle' => (
    is => 'rw',
    isa => 'Google::Chart::Fill::LinearGradient::Angle',
    required => 1
);

has 'color' => (
    is => 'rw',
    isa => 'Google::Chart::Color',
    required => 1
);

has 'offset' => (
    is => 'rw',
    isa => 'Google::Chart::Fill::LinearGradient::Offset',
    required => 1,
);


__PACKAGE__->meta->make_immutable;

no Moose;

sub parameter_value {
    my $self = shift;
    return join(",", $self->target, 'lg', $self->angle, $self->color, $self->offset);
}

1;