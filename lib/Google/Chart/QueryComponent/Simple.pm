# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/lib/Google/Chart/QueryComponent/Simple.pm 67466 2008-07-30T01:53:50.528367Z daisuke  $

package Google::Chart::QueryComponent::Simple;
use Moose::Role;
use URI::Escape ();

with 'Google::Chart::QueryComponent';

requires qw(parameter_name parameter_value);

no Moose;

sub as_query {
    my $self = shift;

    return wantarray ? 
        ($self->parameter_name, $self->parameter_value) :
        join('=', $self->parameter_name, URI::Escape::uri_escape($self->parameter_value))
    ;
};

1;

__END__

=head1 NAME

Google::Chart::QueryComponent::Simple - Simplified Google::Chart Query Component

=head1 SYNOPSIS

  package MyStuff;
  use Moose;
  with 'Google::Chart::QueryComponent::Simple';

=head1 METHODS

=head2 as_query

=cut