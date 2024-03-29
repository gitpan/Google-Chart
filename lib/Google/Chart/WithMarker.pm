package Google::Chart::WithMarker;
use Moose::Role;
use namespace::clean -except => qw(meta);

with 'Google::Chart::WithData';

around _build_dataset_traits => sub {
    my ($next, $self) = @_;

    my $traits = $next->($self);
    push @$traits, 'Google::Chart::DataSet::WithMarker';
    return $traits;
};

around prepare_query => sub {
    my ($next, $self, @args) = @_;

    my @query = $next->($self, @args);

    my $datasets = $self->get_datasets;
    my $max = $#$datasets;
    my @chm;
    for my $i (0..$max) {
        my $dataset = $datasets->[$i];

        if ( $dataset->has_markers ) {
            my $markers = $dataset->markers;
            foreach my $marker (@$markers) {
                push @chm, join(',',
                    $marker->type,
                    $marker->color || '',
                    $i,
                    !defined $marker->point ? -1 : $marker->point,
                    $marker->size || '',
                    $marker->priority || ''
                );
            }
        }
    }

    if (@chm) {
        push @query, ( chm => join('|', @chm) );
    }

    return @query;
};

sub add_marker {
    my ($self, %args) = @_;

    my $dataset_index = delete $args{dataset_index} || 0;
    my $dataset = $self->data->get_dataset_at($dataset_index) or
        confess "dataset at index $dataset_index does NOT exist!";

    $dataset->add_marker(%args);
}

package # hide from PAUSE
    Google::Chart::DataSet::WithMarker;
use Moose::Role;
use namespace::clean -except => qw(meta);

has markers => (
    is => 'ro',
    isa => 'ArrayRef[Google::Chart::Marker]',
    lazy_build => 1,
    predicate => 'has_markers',
);

sub _build_markers { [] }

sub add_marker {
    my ($self, %args) = @_;

    my $marker = Google::Chart::Marker->new(%args);
    push @{ $self->markers }, $marker;
}

package # hide from PAUSE
    Google::Chart::Marker;
use Moose;
use Moose::Util::TypeConstraints qw(subtype as where);
subtype 'Google::Chart::DataSet::MarkerType'
    => as 'Str'
    => where {
        /^(?:[acdosvVhx]|t[^,]+)/
    }
;

has type => (
    is => 'ro',
    isa => 'Google::Chart::DataSet::MarkerType',
);

has color => (
    is => 'ro',
    isa => 'Str',
);

has size => (
    is => 'ro',
    isa => 'Num',
);

has point => (
    is => 'ro',
    isa => 'Num',
);

has priority => (
    is => 'ro',
    isa => 'Num',
);

__PACKAGE__->meta->make_immutable();

1;