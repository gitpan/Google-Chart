use strict;
use LWP::UserAgent;

my $ua = LWP::UserAgent->new();
my $res = $ua->get("http://code.google.com/intl/ja/apis/chart/");
my $content_ref = $res->content_ref;

print "my %charts = (\n";
while ($$content_ref =~ m{src="(http://chart.apis.google.com/chart[\w/\.,|?&;=:-]+)}g) {
    print qq|    '$1' => sub {\n    },\n|;
}
print ");\n";
