# $Id: /mirror/coderepos/lang/perl/Google-Chart/trunk/t/lib/Test/Google/Chart.pm 92672 2008-11-26T04:39:57.568658Z daisuke  $

package Test::Google::Chart;
use strict;
use warnings;
use Google::Chart;
use IO::Socket::INET;

use Exporter 'import';

our @EXPORT_OK = qw(have_connection);

sub have_connection {
    my $url = Google::Chart::BASE_URI;
    my $socket = IO::Socket::INET->new(
        PeerAddr => $url->host,
        PeerPort => $url->port
    );

    if (! $socket) {
        return 0;
    } else {
        $socket->close;
        return 1;
    }
}

1;