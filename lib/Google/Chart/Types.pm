# $Id: /mirror/coderepos/lang/perl/Google-Chart/branches/moose/lib/Google/Chart/Types.pm 66666 2008-07-24T01:59:15.912086Z daisuke  $

package Google::Chart::Types;
use Moose;
use Moose::Util::TypeConstraints;
use Sub::Exporter -setup => {
    exports => [ qw(hash_coercion) ]
};

sub hash_coercion {
    my (%args) = @_;

    my $default = $args{default};
    my $prefix  = $args{prefix};

    return sub {
        my $h = $_;
        my $module = $h->{module} || $default ||
            confess "No module name provided for coercion";
        if ($module !~ s/^\+//) {
            $module = join('::', $prefix, $module);
        }
        Class::MOP::load_class( $module );
        return $module->new(%{ $h->{args} });
    }
}

{
    subtype 'Google::Chart::Color'
        => as 'Str'
        => where { /^[a-f0-9]{6}/i }
    ;
}

{
    role_type 'Google::Chart::Type';
    coerce 'Google::Chart::Type'
        => from 'Str'
        => via {
            my $class = sprintf( 'Google::Chart::Type::%s', ucfirst $_ );
            Class::MOP::load_class($class);

            return $class->new();
        }
    ;
    coerce 'Google::Chart::Type'
        => from 'HashRef'
        => hash_coercion(prefix => "Google::Chart::Type")
    ;
}

{
    role_type 'Google::Chart::Data';
    coerce 'Google::Chart::Data'
        => from 'ArrayRef'
        => via {
            my $class = 'Google::Chart::Data::Text';
            Class::MOP::load_class($class);
            $class->new(datasets => $_);
        }
    ;
    coerce 'Google::Chart::Data'
        => from 'HashRef'
        => via {
            my $class = $_->{module};
            if ($class !~ s/^\+//) {
                $class = "Google::Chart::Data::$class";
            }
            Class::MOP::load_class($class);

            $class->new(%{$_->{args}});
        }
    ;
}

no Moose;

1;

__END__

=head1 NAME

Google::Chart::Types - Google::Chart Miscellaneous Types

=head1 FUNCTIONS

=head2 hash_coercion

=cut
