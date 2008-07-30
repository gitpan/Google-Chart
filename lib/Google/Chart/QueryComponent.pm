# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/lib/Google/Chart/QueryComponent.pm 67466 2008-07-30T01:53:50.528367Z daisuke  $

package Google::Chart::QueryComponent;
use Moose::Role;

requires 'as_query';

no Moose;

1;

__END__

=head1 NAME

Google::Chart::QueryComponent - Google::Chart Query Component

=head1 SYNOPSIS

  package MyStuff;
  use Moose;
  with 'Google::Chart::QueryComponent';

=head1 METHODS

=head2 as_query

=cut
