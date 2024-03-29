use strict;
use inc::Module::Install;

my $have_previous = eval {
    require Google::Chart;
    $Google::Chart::VERSION < 0.05000;
};

if ($have_previous) {
    my $y_n = prompt(<<EOM, "n");

You seem to have an old version of Google::Chart installed.
As this version of Google::Chart breaks a lot of backwards compatibility,
installing this *WILL* break your code if you have something that depends on it.

Are you sure you want to continue? [y/N]
EOM
    if ($y_n !~ /^y(?:es)?$/i) {
        exit 0;
    }
}

name 'Google-Chart';

all_from('lib/Google/Chart.pm');

requires 'namespace::clean';
requires 'Encode';
requires 'LWP::UserAgent';
requires 'Moose', '0.92';
requires 'Sub::Exporter';
requires 'Scalar::Util';
requires 'URI';
requires 'URI::Escape';

test_requires 'Test::MockObject';
test_requires 'Test::More' => '0.82';
test_requires 'Test::UseAllModules';
no_index directory => 'docs';
no_index directory => 'tool';

# auto_include_deps;
WriteAll;
