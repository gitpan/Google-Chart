
package Google::Chart::Type::Bar;
use Moose;
use Moose::Util::TypeConstraints;
use namespace::clean -except => qw(meta);

extends 'Google::Chart';
with qw(
    Google::Chart::WithAxis
    Google::Chart::WithData 
    Google::Chart::WithGrid
    Google::Chart::WithLinearGradientFill
    Google::Chart::WithLinearStripe
    Google::Chart::WithLineDrawStyle
    Google::Chart::WithMarker
    Google::Chart::WithRangeFill
    Google::Chart::WithSolidFill
);

has bar_zero => (
    is => 'ro',
    isa => 'Num',
    predicate => 'has_bar_zero',
);

has bar_space => (
    is => 'ro',
    isa => 'Int',
    predicate => 'has_bar_space',
);

has bar_width => (
    is => 'ro',
    isa => 'Int',
    predicate => 'has_bar_width',
);

has group_space => (
    is => 'ro',
    isa => 'Int',
    predicate => 'has_group_space',
);
    
has orientation => (
    is      => 'ro',
    isa     => enum([ qw(horizontal vertical) ]),
    default => 'vertical',
);

has stacked => (
    is       => 'ro',
    isa      => 'Bool',
    default  => 0,
);

sub _build_type {
    my $self = shift;
    
    return sprintf( 'b%s%s', 
        $self->orientation eq 'vertical' ? 'v' : 'h',
        $self->stacked                   ? 's' : 'g'
    );
}

around prepare_query => sub {
    my ($next, $self, @args) = @_;

    my @query = $next->($self, @args);
    my @comps;
    $comps[0] = $self->bar_width if $self->has_bar_width;
    $comps[1] = $self->bar_space if $self->has_bar_space;
    $comps[2] = $self->group_space if $self->has_group_space;
    if (@comps > 0) { 
        push @query, (chbh => join(',', @comps));
    }

    if ($self->has_bar_zero) {
        push @query, (chp => $self->bar_zero);
    }

    return @query;
};

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

Google::Chart::Type::Bar - Google::Chart Bar Type

=head1 SYNOPSIS

  Google::Chart->create(
    Bar => (
      bar_space   => 20,
      bar_width   => 10,
      group_space => 5,
      orientation => 'horizontal'
      size        => "400x300",
      stacked     => 1, 
    )
  );

=cut