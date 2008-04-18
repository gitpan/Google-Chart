package Google::Chart::Data;

use strict;
use warnings;


our $VERSION = '0.04';


use base qw(Google::Chart::Base);


__PACKAGE__
    ->mk_scalar_accessors(qw(max_value))
    ->mk_array_accessors(qw(value_sets))
    ->mk_abstract_accessors(qw(encode_value_set));


use constant ENCODING_TYPE_VALUE => '?';   # override in subclasses


sub has_content {
    my $self = shift;
    $self->value_sets_count;
}


sub as_string {
    my $self = shift;
    sprintf 'chd=%s:%s',
        $self->ENCODING_TYPE_VALUE,
        join ',' =>
        map { $self->encode_value_set($_) }
        $self->value_sets;
}


1;


__END__



=head1 NAME

Google::Chart::Data - Draw a chart with Google Chart

=head1 SYNOPSIS

    Google::Chart::Data->new;

=head1 WARNING

This is a very early alpha release. It is more a proof of concept, but for
very simple cases it already works. Documentation and more complete support of
the Google Chart API will follow shortly. For now, the code more or less is
the documentation. Patches welcome.

=head1 DESCRIPTION

This set of classes uses the Google Chart API - see
L<http://code.google.com/apis/chart/> - to draw charts.

=head1 METHODS

=over 4

=item clear_max_value

    $obj->clear_max_value;

Clears the value.

=item clear_value_sets

    $obj->clear_value_sets;

Deletes all elements from the array.

=item count_value_sets

    my $count = $obj->count_value_sets;

Returns the number of elements in the array.

=item index_value_sets

    my $element   = $obj->index_value_sets(3);
    my @elements  = $obj->index_value_sets(@indices);
    my $array_ref = $obj->index_value_sets(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item max_value

    my $value = $obj->max_value;
    $obj->max_value($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item max_value_clear

    $obj->max_value_clear;

Clears the value.

=item pop_value_sets

    my $value = $obj->pop_value_sets;

Pops the last element off the array, returning it.

=item push_value_sets

    $obj->push_value_sets(@values);

Pushes elements onto the end of the array.

=item set_value_sets

    $obj->set_value_sets(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item shift_value_sets

    my $value = $obj->shift_value_sets;

Shifts the first element off the array, returning it.

=item splice_value_sets

    $obj->splice_value_sets(2, 1, $x, $y);
    $obj->splice_value_sets(-1);
    $obj->splice_value_sets(0, -1);

Takes three arguments: An offset, a length and a list.

Removes the elements designated by the offset and the length from the array,
and replaces them with the elements of the list, if any. In list context,
returns the elements removed from the array. In scalar context, returns the
last element removed, or C<undef> if no elements are removed. The array grows
or shrinks as necessary. If the offset is negative then it starts that far
from the end of the array. If the length is omitted, removes everything from
the offset onward. If the length is negative, removes the elements from the
offset onward except for -length elements at the end of the array. If both the
offset and the length are omitted, removes everything. If the offset is past
the end of the array, it issues a warning, and splices at the end of the
array.

=item unshift_value_sets

    $obj->unshift_value_sets(@values);

Unshifts elements onto the beginning of the array.

=item value_sets

    my @values    = $obj->value_sets;
    my $array_ref = $obj->value_sets;
    $obj->value_sets(@values);
    $obj->value_sets($array_ref);

Get or set the array values. If called without an arguments, it returns the
array in list context, or a reference to the array in scalar context. If
called with arguments, it expands array references found therein and sets the
values.

=item value_sets_clear

    $obj->value_sets_clear;

Deletes all elements from the array.

=item value_sets_count

    my $count = $obj->value_sets_count;

Returns the number of elements in the array.

=item value_sets_index

    my $element   = $obj->value_sets_index(3);
    my @elements  = $obj->value_sets_index(@indices);
    my $array_ref = $obj->value_sets_index(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item value_sets_pop

    my $value = $obj->value_sets_pop;

Pops the last element off the array, returning it.

=item value_sets_push

    $obj->value_sets_push(@values);

Pushes elements onto the end of the array.

=item value_sets_set

    $obj->value_sets_set(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item value_sets_shift

    my $value = $obj->value_sets_shift;

Shifts the first element off the array, returning it.

=item value_sets_splice

    $obj->value_sets_splice(2, 1, $x, $y);
    $obj->value_sets_splice(-1);
    $obj->value_sets_splice(0, -1);

Takes three arguments: An offset, a length and a list.

Removes the elements designated by the offset and the length from the array,
and replaces them with the elements of the list, if any. In list context,
returns the elements removed from the array. In scalar context, returns the
last element removed, or C<undef> if no elements are removed. The array grows
or shrinks as necessary. If the offset is negative then it starts that far
from the end of the array. If the length is omitted, removes everything from
the offset onward. If the length is negative, removes the elements from the
offset onward except for -length elements at the end of the array. If both the
offset and the length are omitted, removes everything. If the offset is past
the end of the array, it issues a warning, and splices at the end of the
array.

=item value_sets_unshift

    $obj->value_sets_unshift(@values);

Unshifts elements onto the beginning of the array.

=back

Google::Chart::Data inherits from L<Google::Chart::Base>.

The superclass L<Google::Chart::Base> defines these methods and functions:

    new(), is_number(), validate()

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

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<googlechart> tag.

=head1 VERSION 
                   
This document describes version 0.04 of L<Google::Chart::Data>.

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

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007-2008 by the authors.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

