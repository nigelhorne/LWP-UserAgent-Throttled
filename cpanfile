# Generated from Makefile.PL using makefilepl2cpanfile

requires 'perl', '5.6.2';

requires 'LWP';
requires 'LWP::UserAgent';
requires 'Time::HiRes';
requires 'URI';

on 'build' => sub {
	requires 'IO::Socket::INET';
};

on 'test' => sub {
	requires 'LWP::Protocol::https';
	requires 'Test::DescribeMe';
	requires 'Test::Exception', '0.42';
	requires 'Test::Most';
	requires 'Test::Needs';
	requires 'Test::NoWarnings';
	requires 'Test::RequiresInternet';
	requires 'Test::Timer', '2.01';
};

on 'develop' => sub {
	requires 'Devel::Cover';
	requires 'Perl::Critic';
	requires 'Test::Pod';
	requires 'Test::Pod::Coverage';
};
