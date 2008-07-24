# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Axis/Style.pm 66620 2008-07-23T05:51:19.793422Z daisuke  $

package Google::Chart::Axis::Style;
use Moose;
use Moose::Util::TypeConstraints;
use Google::Chart::Types;

enum 'Google::Chart::Axis::Alignment' => qw(-1 0 1);

has 'color' => (
    is => 'rw',
    isa => 'Google::Chart::Color'
);

has 'font_size' => (
    is => 'rw',
    isa => 'Num',
);

has 'alignment' => (
    is => 'rw',
    isa => 'Google::Chart::Axis::Alignment'
);

__PACKAGE__->meta->make_immutable;

no Moose;

sub as_query {
    my $self = shift;
    return join(',', $self->color || '', $self->font_size || '', $self->alignment || 0);
}

1;

__END__

=head1 NAME

Google::Chart::Axis::Style - Google::Chart Axis Style

=head1 METHODS

=head2 as_query

=cut
