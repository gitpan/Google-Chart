package Google::Chart::Color;

use strict;
use warnings;


our $VERSION = '0.02';


use base qw(Google::Chart::Base);


__PACKAGE__
    ->mk_scalar_accessors(qw(red green blue transparency));


use constant DEFAULTS => (
    red   => 0,
    green => 0,
    blue  => 0,
);


sub new_from_rgbt {
    my ($class, $rgbt) = @_;
    my $self = $class->new;
    $self->rgbt($rgbt);
    $self;
}


sub new_from_hex {
    my ($class, $hex) = @_;
    my $self = $class->new;
    $self->hex($hex);
    $self;
}


sub rgbt {
    my $self = shift;
    if (@_) {
        my ($red, $green, $blue, $transparency) = @{ $_[0] };
        $self->red($red);
        $self->green($green);
        $self->blue($blue);
        $self->transparency($transparency);
        return $self;   # for chaining
    } else {
        return [ $self->red, $self->green, $self->blue, $self->transparency ];
    }
}


sub hex {
    my $self = shift;
    if (@_) {
        my $hex = shift;
        $hex =~ s/^#//;
        $hex =~ s/(.)/$1$1/g if length($hex) == 3;
        my ($red, $green, $blue, $transparency) =
            map { defined($_) ? hex : undef }
            $hex =~ /(.{2})/g;
        $self->red($red);
        $self->green($green);
        $self->blue($blue);
        $self->transparency($transparency);
        return $self;   # for chaining
    } else {
        my $to_hex = sub { substr sprintf('0%x', shift), -2 };
        my $value = uc
            join '' =>
            map { $to_hex->($self->$_) }
            qw(red green blue);
        $value .= $to_hex->($self->transparency) if
            defined $self->transparency;
        return $value;
    }
}


sub guess {
    my ($self, $input) = @_;
    if (ref $input eq 'ARRAY') {
        $self->rgbt($input)
    } elsif (UNIVERSAL::can($input, 'rgbt')) {
        $self->rgbt($input->rgbt)
    } else {
        $self->hex($input);
    }
    $self;   # for chaining
}


sub validate {
    my ($self, $chart) = @_;
    
    my @error;
    for (qw(red green blue transparency)) {
        unless ($_ eq 'transparency' || defined $self->$_) {
            push @error, "$_ color component is not defined";
            next;
        }

        unless ($self->is_number($self->$_)) {
            push @error, "$_ color component is not a number";
            next;
        }

        my $value = int $self->$_;

        if ($value < 0) {
            push @error, "$_ color component is less than zero";
            next;
        }

        if ($value > 255) {
            push @error, "$_ color component is greater than 255";
            next;
        }
    }

    @error;
}


sub as_string {
    my $self = shift;
    my $k
}


1;


__END__



=head1 NAME

Google::Chart::Color - Draw a chart with Google Chart

=head1 SYNOPSIS

    Google::Chart::Color->new;

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

=item blue

    my $value = $obj->blue;
    $obj->blue($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item blue_clear

    $obj->blue_clear;

Clears the value.

=item clear_blue

    $obj->clear_blue;

Clears the value.

=item clear_green

    $obj->clear_green;

Clears the value.

=item clear_red

    $obj->clear_red;

Clears the value.

=item clear_transparency

    $obj->clear_transparency;

Clears the value.

=item green

    my $value = $obj->green;
    $obj->green($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item green_clear

    $obj->green_clear;

Clears the value.

=item red

    my $value = $obj->red;
    $obj->red($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item red_clear

    $obj->red_clear;

Clears the value.

=item transparency

    my $value = $obj->transparency;
    $obj->transparency($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item transparency_clear

    $obj->transparency_clear;

Clears the value.

=back

Google::Chart::Color inherits from L<Google::Chart::Base>.

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

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<googlechart> tag.

=head1 VERSION 
                   
This document describes version 0.02 of L<Google::Chart::Color>.

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

