#!perl -w

use warnings;
use strict;
use Test::Most tests => 4;

BEGIN {
	use_ok('LWP::Throttle');
}

THROTTLE: {
	my $ua = new_ok('LWP::Throttle');

	$ua->load(1);
	ok($ua->load() == 1);

	my $response = $ua->get('http://search.cpan.org/');

	ok($response->is_success());
}
