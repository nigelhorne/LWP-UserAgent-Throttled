#!/usr/bin/perl -w

use strict;
use warnings;

use Test::Most;

if($ENV{AUTHOR_TESTING}) {
	eval 'use Test::ConsistentVersion';

	plan(skip_all => 'Test::ConsistentVersion required for checking versions') if $@;

	Test::ConsistentVersion::check_consistent_versions();
} else {
	plan(skip_all => 'Author tests not required for installation');
}
