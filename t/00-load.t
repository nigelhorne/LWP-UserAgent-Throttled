#!perl -T

use strict;

use Test::Most tests => 2;

BEGIN {
    use_ok('LWP::Throttle') || print 'Bail out!';
}

require_ok('LWP::Throttle') || print 'Bail out!';

diag( "Testing LWP::Throttle $LWP::Throttle::VERSION, Perl $], $^X" );
