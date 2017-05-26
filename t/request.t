#!perl -w

use warnings;
use strict;
use Test::Most tests => 3;

BEGIN {
	use_ok('LWP::Throttle');
}

THROTTLE: {
	my $ua = new_ok('LWP::Throttle');

	my $response = $ua->get('http://search.cpan.org/');

	ok($response->is_success());
}
