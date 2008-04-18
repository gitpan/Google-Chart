package Google::Chart::Factory;

use warnings;
use strict;


our $VERSION = '0.04';


use base qw(Class::Factory::Enhanced);


__PACKAGE__->register_factory_type(
    color                  => 'Google::Chart::Color',
    color_data             => 'Google::Chart::Color::Data',
    data                   => 'Google::Chart::Data',
    data_simple_encoding   => 'Google::Chart::Data::SimpleEncoding',
    # data_text_encoding     => 'Google::Chart::Data::TextEncoding',
    data_extended_encoding => 'Google::Chart::Data::ExtendedEncoding',
    size                   => 'Google::Chart::Size',
    type                   => 'Google::Chart::Type',
    type_line              => 'Google::Chart::Type::Line::LineX',
    type_line_xy           => 'Google::Chart::Type::Line::LineXY',
    type_bar_hor_stacked   => 'Google::Chart::Type::Bar::HorizontalStacked',
    type_bar_vert_stacked  => 'Google::Chart::Type::Bar::VerticalStacked',
    type_bar_hor_grouped   => 'Google::Chart::Type::Bar::HorizontalGrouped',
    type_bar_vert_grouped  => 'Google::Chart::Type::Bar::VerticalGrouped',
    type_pie_2d            => 'Google::Chart::Type::Pie::TwoDimensional',
    type_pie_3d            => 'Google::Chart::Type::Pie::ThreeDimensional',
    type_venn              => 'Google::Chart::Type::Venn',
    type_scatter_plot      => 'Google::Chart::Type::ScatterPlot',
);


1;


__END__



=head1 NAME

Google::Chart::Factory - Draw a chart with Google Chart

=head1 SYNOPSIS

    Google::Chart::Factory->new;

=head1 WARNING

This is a very early alpha release. It is more a proof of concept, but for
very simple cases it already works. Documentation and more complete support of
the Google Chart API will follow shortly. For now, the code more or less is
the documentation. Patches welcome.

=head1 DESCRIPTION

This set of classes uses the Google Chart API - see
L<http://code.google.com/apis/chart/> - to draw charts.

Google::Chart::Factory inherits from L<Class::Factory::Enhanced>.

The superclass L<Class::Factory::Enhanced> defines these methods and
functions:

    add_factory_type(), make_object_for_type(), register_factory_type()

The superclass L<Class::Factory> defines these methods and functions:

    new(), factory_error(), factory_log(), get_factory_class(),
    get_factory_type_for(), get_loaded_classes(), get_loaded_types(),
    get_my_factory(), get_my_factory_type(), get_registered_class(),
    get_registered_classes(), get_registered_types(), init(),
    remove_factory_type(), unregister_factory_type()

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<googlechart> tag.

=head1 VERSION 
                   
This document describes version 0.04 of L<Google::Chart::Factory>.

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

