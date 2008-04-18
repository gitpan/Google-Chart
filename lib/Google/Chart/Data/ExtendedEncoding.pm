package Google::Chart::Data::ExtendedEncoding;

# $Id: ExtendedEncoding.pm 307 2008-02-02 15:40:09Z queinnec $
# Copyright 2008 by Christian Queinnec

use strict;
use warnings;


our $VERSION = '0.04';


use base qw(Google::Chart::Data);


use constant ENCODING_TYPE_VALUE => 'e';


my @map = ('A'..'Z', 'a'..'z', 0..9, '-', '.');


# Due to rounding errors, max_value may be encoded as .- instead of ..

sub encode_value_set {
    my ($self, $value_set) = @_;
    my $result = '';

    for my $value ( @{$value_set} ) {
        if ( $self->is_number($value) ) {
            # Normalize value
            my $scale = (scalar(@map) * scalar(@map)) - 1;
            my $normalized_value = int(($value * $scale) / $self->max_value);

            # Truncate values out of [0 .. max_value]
            $normalized_value = 0
              if $normalized_value <= 0;
            $normalized_value = $self->max_value - 1
              if $normalized_value >= $self->max_value;

            my $hi  = int($normalized_value / scalar(@map));
            my $low = int($normalized_value % scalar(@map));
            # warn "value=$value, normalized_value=$normalized_value, hi=$hi, low=$low\n";
            $result .= $map[$hi] . $map[$low];
        } else {
            $result .= '__';
        }
    }
    $result;
}

1;

__END__



=head1 NAME

Google::Chart::Data::ExtendedEncoding - Extended encodings of sets of values

=head1 SYNOPSIS

    use Google::Chart;
    my $chart = Google::Chart->new(
        type_name => 'type_line',
        set_size  => [ 300, 100 ],
        data_spec => {
            encoding  => 'data_extended_encoding',
            max_value => 64*64-1,
            value_sets => [ [ -1, 0, 64], [ 64*63, 64*64-1, 64*64 ] ],
        },
    );

=head1 DESCRIPTION

This module encodes sets of values with the "extended encoding" rules as
defined by Google (see L<http://code.google.com/apis/chart/>). 4096 final
values are possible with that encoding, whereas only 62 values are possible
with simple encoding, see L<Google::Chart::Data::SimpleEncoding> for further
details.

The specified values are first normalized with respect to the specified
max_value then scaled to spread the [0..4096[ interval.  Values out of
[0..max_value[ are considered to be, 0 or max_value respectively.
Non-numerical values are mapped onto undefined values encoded as C<__>.

=head1 WARNINGS

Due to rounding errors, a value equals to max_value may encoded as C<._>
instead of C<..>.

=head1 METHODS

=over 4



=back

Google::Chart::Data::ExtendedEncoding inherits from L<Google::Chart::Data>.

The superclass L<Google::Chart::Data> defines these methods and functions:

    as_string(), clear_max_value(), clear_value_sets(), count_value_sets(),
    has_content(), index_value_sets(), max_value(), max_value_clear(),
    pop_value_sets(), push_value_sets(), set_value_sets(),
    shift_value_sets(), splice_value_sets(), unshift_value_sets(),
    value_sets(), value_sets_clear(), value_sets_count(),
    value_sets_index(), value_sets_pop(), value_sets_push(),
    value_sets_set(), value_sets_shift(), value_sets_splice(),
    value_sets_unshift()

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
                   
This document describes version 0.04 of L<Google::Chart::Data::ExtendedEncoding>.

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

Christian Queinnec C<< christian@queinnec.org >>

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007-2008 by the authors.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

