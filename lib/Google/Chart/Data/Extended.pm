# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Data/Extended.pm 66620 2008-07-23T05:51:19.793422Z daisuke  $

package Google::Chart::Data::Extended;
use Moose;
use Scalar::Util qw(looks_like_number);

with 'Google::Chart::Data';

has 'max_value' => (
    is => 'rw', 
    isa => 'Num',
    required => 1,
);

has '+dataset' => (
    isa => 'ArrayRef[Num]',
);

__PACKAGE__->meta->make_immutable;

no Moose;

my @map = ('A'..'Z', 'a'..'z', 0..9, '-', '.');

sub parameter_value {
    my $self = shift;
    my $max = $self->max_value;
    my $dataset = $self->dataset;

    my $result   = 'e:';
    my $map_size = scalar @map;
    my $scale    = $map_size ** 2  - 1;
    foreach my $data (@$dataset) {
        my $v = '__';
        if (defined $data && looks_like_number($data)) {
            my $normalized = int(($data * $scale) / $max);
            if ($normalized < 0) {
                $normalized = 0;
            } elsif ($normalized >= $scale) {
                $normalized = $scale - 1;
            }

            $v = $map[ int($normalized / $map_size)  ] . $map[ int($normalized % $map_size) ];
        }

        $result .= $v;
    }
    return $result;
}

1;

__END__

=head1 NAME

Google::Chart::Data::Extended - Google::Chart Extended Data Encoding

=head1 SYNOPSIS

=head1 METHODS

=head2 parameter_value

=cut