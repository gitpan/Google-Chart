# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Type/Pie.pm 66683 2008-07-24T05:52:58.814530Z daisuke  $

package Google::Chart::Type::Pie;
use Moose;
use Moose::Util::TypeConstraints;

with 'Google::Chart::Type::Simple';

has 'pie_type' => (
    is => 'rw',
    isa => enum([ qw(2d 3d) ]),
    required => 1,
    default => '2d'
);

__PACKAGE__->meta->make_immutable;

no Moose;

sub parameter_value {
    my $self = shift;

    return $self->pie_type eq '3d' ? 'p3' : 'p';
}

1;

__END__

=head1 NAME

Google::Chart::Type::Pie - Google::Chart Pie Chart Type

=head1 SYNOPSIS

  Google::Chart->new(
    type => 'Pie'
  );

  Google::Chart->new(
    type => {
      module => 'Pie',
      args   => {
        pie_type => '3d'
      }
    }
  );

=cut