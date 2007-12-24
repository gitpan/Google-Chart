package Google::Chart;

use strict;
use warnings;
use LWP::UserAgent;


our $VERSION = '0.03';


use base qw(
    Google::Chart::Base
    Google::Chart::Factory
);


__PACKAGE__
    ->mk_scalar_accessors(qw(title ua))
    ->mk_factory_typed_accessors('Google::Chart::Factory',
        data       => 'data',
        type       => 'type',
        size       => 'size',
        color_data => 'color_data',
    );


use constant DEFAULTS => (
    ua => LWP::UserAgent->new,
);


use constant API_URI => 'http://chart.apis.google.com/chart?';


sub make_obj {
    my $self = shift;
    Google::Chart::Factory->make_object_for_type(@_);
}


# Convenience methods for using underlying objects

sub set_size {
    my $self = shift;
    my ($x, $y);
    if (@_ == 1 && ref $_[0] eq 'ARRAY') {
        ($x, $y) = @{ $_[0] };
    } else {
        ($x, $y) = @_;
    }
    $self->size->x($x);
    $self->size->y($y);
}


sub type_name {
    my ($self, $type_name, @args) = @_;
    $self->type($self->make_obj($type_name, @args));
}


sub data_spec {
    my ($self, $args) = @_;
    die "data_spec has no 'encoding' key\n" unless $args->{encoding};
    my $encoding = delete $args->{encoding};
    $self->data($self->make_obj($encoding, %$args));
}


sub colors {
    my ($self, @args) = @_;
    @args =
        map { $self->make_obj('color')->guess($_) }
        @args;
    $self->color_data(colors => \@args);
}


# End of convenience methods


sub validate {
    my $self = shift;
    my @error = map { $self->$_->validate } qw(
        size type data color_data
    );
    die join "\n" => @error if @error;
}


sub get_url {
    my $self = shift;
    my $url = $self->API_URI .
        join '&' =>
        map { $self->$_->as_string }
        grep { $self->$_->has_content }
        qw(size data type color_data);
}


sub img_tag {
    my $self = shift;
    my $url = $self->get_url;
    $url =~ s/&/&amp;/g;
    qq{<IMG SRC="$url" />};
}


sub render {
    my $self = shift;
    my $response = $self->ua->get($self->get_url);

    if ($response->is_success) {
        return $response->content;
    } else {
        die $response->status_line;
    }
}


sub render_to_file {
    my ($self, $filename) = @_;

    open my $fh, '>', $filename or die "can't open $filename for writing: $!\n";
    print $fh $self->render;
    close $fh or die "can't close $filename: $!\n";
}


1;


__END__



=head1 NAME

Google::Chart - Draw a chart with Google Chart

=head1 SYNOPSIS

    use Google::Chart;
    
    my $chart = Google::Chart->new(
        type_name => 'type_pie_3d',
        set_size  => [ 300, 100 ],
        data_spec => {
            encoding  => 'data_simple_encoding',
            max_value => 100,
            value_sets => [ [ map { $_ * 10 } 0..10 ] ],
        },
    );

    print $chart->get_url;
    $chart->render_to_file('my_chart.png');

=head1 WARNING

This is a very early alpha release. It is more a proof of concept, but for
very simple cases it already works. Documentation and more complete support of
the Google Chart API will follow shortly. For now, the code more or less is
the documentation. Patches welcome.

I've neverthless released the distribution, in the I<spirit of one-point-oh>,
as Douglas Coupland puts it, or rather, in the spirit of point-oh-one.

=head1 DESCRIPTION

This set of classes uses the Google Chart API - see
L<http://code.google.com/apis/chart/> - to draw charts.

=head1 METHODS

=over 4

=item clear_title

    $obj->clear_title;

Clears the value.

=item clear_ua

    $obj->clear_ua;

Clears the value.

=item title

    my $value = $obj->title;
    $obj->title($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item title_clear

    $obj->title_clear;

Clears the value.

=item ua

    my $value = $obj->ua;
    $obj->ua($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item ua_clear

    $obj->ua_clear;

Clears the value.

=back

Google::Chart inherits from L<Google::Chart::Base> and
L<Google::Chart::Factory>.

The superclass L<Google::Chart::Base> defines these methods and functions:

    new(), is_number()

The superclass L<Class::Accessor::Complex> defines these methods and
functions:

    mk_abstract_accessors(), mk_array_accessors(), mk_boolean_accessors(),
    mk_class_array_accessors(), mk_class_hash_accessors(),
    mk_class_scalar_accessors(), mk_concat_accessors(),
    mk_forward_accessors(), mk_hash_accessors(), mk_integer_accessors(),
    mk_new(), mk_object_accessors(), mk_scalar_accessors(),
    mk_set_accessors(), mk_singleton()

The superclass L<Class::Accessor> defines these methods and functions:

    _carp(), _croak(), _mk_accessors(), accessor_name_for(),
    best_practice_accessor_name_for(), best_practice_mutator_name_for(),
    follow_best_practice(), get(), make_accessor(), make_ro_accessor(),
    make_wo_accessor(), mk_accessors(), mk_ro_accessors(),
    mk_wo_accessors(), mutator_name_for(), set()

The superclass L<Class::Accessor::Installer> defines these methods and
functions:

    install_accessor()

The superclass L<Class::Accessor::Constructor> defines these methods and
functions:

    _make_constructor(), mk_constructor(), mk_constructor_with_dirty(),
    mk_singleton_constructor()

The superclass L<Data::Inherited> defines these methods and functions:

    every_hash(), every_list(), flush_every_cache_by_key()

The superclass L<Class::Accessor::FactoryTyped> defines these methods and
functions:

    clear_factory_typed_accessors(), clear_factory_typed_array_accessors(),
    count_factory_typed_accessors(), count_factory_typed_array_accessors(),
    factory_typed_accessors(), factory_typed_accessors_clear(),
    factory_typed_accessors_count(), factory_typed_accessors_index(),
    factory_typed_accessors_pop(), factory_typed_accessors_push(),
    factory_typed_accessors_set(), factory_typed_accessors_shift(),
    factory_typed_accessors_splice(), factory_typed_accessors_unshift(),
    factory_typed_array_accessors(), factory_typed_array_accessors_clear(),
    factory_typed_array_accessors_count(),
    factory_typed_array_accessors_index(),
    factory_typed_array_accessors_pop(),
    factory_typed_array_accessors_push(),
    factory_typed_array_accessors_set(),
    factory_typed_array_accessors_shift(),
    factory_typed_array_accessors_splice(),
    factory_typed_array_accessors_unshift(),
    index_factory_typed_accessors(), index_factory_typed_array_accessors(),
    mk_factory_typed_accessors(), mk_factory_typed_array_accessors(),
    pop_factory_typed_accessors(), pop_factory_typed_array_accessors(),
    push_factory_typed_accessors(), push_factory_typed_array_accessors(),
    set_factory_typed_accessors(), set_factory_typed_array_accessors(),
    shift_factory_typed_accessors(), shift_factory_typed_array_accessors(),
    splice_factory_typed_accessors(),
    splice_factory_typed_array_accessors(),
    unshift_factory_typed_accessors(),
    unshift_factory_typed_array_accessors()

The superclass L<Class::Accessor::Constructor::Base> defines these methods
and functions:

    STORE(), clear_dirty(), clear_hygienic(), clear_unhygienic(),
    contains_hygienic(), contains_unhygienic(), delete_hygienic(),
    delete_unhygienic(), dirty(), dirty_clear(), dirty_set(),
    elements_hygienic(), elements_unhygienic(), hygienic(),
    hygienic_clear(), hygienic_contains(), hygienic_delete(),
    hygienic_elements(), hygienic_insert(), hygienic_is_empty(),
    hygienic_size(), insert_hygienic(), insert_unhygienic(),
    is_empty_hygienic(), is_empty_unhygienic(), set_dirty(),
    size_hygienic(), size_unhygienic(), unhygienic(), unhygienic_clear(),
    unhygienic_contains(), unhygienic_delete(), unhygienic_elements(),
    unhygienic_insert(), unhygienic_is_empty(), unhygienic_size()

The superclass L<Tie::StdHash> defines these methods and functions:

    CLEAR(), DELETE(), EXISTS(), FETCH(), FIRSTKEY(), NEXTKEY(), SCALAR(),
    TIEHASH()

The superclass L<Class::Factory::Enhanced> defines these methods and
functions:

    add_factory_type(), make_object_for_type(), register_factory_type()

The superclass L<Class::Factory> defines these methods and functions:

    factory_error(), factory_log(), get_factory_class(),
    get_factory_type_for(), get_loaded_classes(), get_loaded_types(),
    get_my_factory(), get_my_factory_type(), get_registered_class(),
    get_registered_classes(), get_registered_types(), init(),
    remove_factory_type(), unregister_factory_type()

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<googlechart> tag.

=head1 VERSION 
                   
This document describes version 0.03 of L<Google::Chart>.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<<bug-google-chart@rt.cpan.org>>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

