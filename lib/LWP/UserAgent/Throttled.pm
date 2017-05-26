package LWP::UserAgent::Throttled;

use LWP;
use Time::HiRes;

our @ISA = ('LWP::UserAgent');

=head1 NAME

LWP::UserAgent::Throttled - Throttle requests to a site

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Some sites with REST APIs, such as openstreetmap.org, will blacklist you if you do too many requests.

    use LWP::UserAgent::Throttled;
    my $ua = LWP::UserAgent::Throttled->new();
    $ua->load(5);
    print $ua->get('http://www.example.com');
    sleep (2);
    print $ua->get('http://www.example.com');	# Will wait at least 3 seconds before the GET is sent

=cut

=head1 SUBROUTINES/METHODS

=head2 new

Creates a LWP::UserAgent::Throttled object.

=cut

sub new {
	my $class = shift;

	my $rc = $class->SUPER::new(@_);
	$rc->{'load'} = 1;
	
	return bless $rc, $class;
}

=head2 send_request

See L<LWP::UserAgent>.

=cut

sub send_request {
	my $self = shift;

	if(defined($self->{'load'})) {
		if($self->{'lastcallended'}) {
			my $now = Time::HiRes::time();
			my $waittime = $self->{'load'} - (Time::HiRes::time() - $self->{'lastcallended'});

			if($waittime > 0) {
				Time::HiRes::usleep($waittime * 1e6);
			}
		}
	}
	my $rc = $self->SUPER::send_request(@_);
	$self->{'lastcallended'} = Time::HiRes::time();
	return $rc;
}

=head2 load

Get/set the number of seconds between each request. The default is one second.

=cut

sub load {
	my $self = shift;
	my $load = shift;

	if($load) {
		$self->{'load'} = $load;
	}

	return $self->{'load'};
}

=head1 AUTHOR

Nigel Horne, C<< <njh at bandsman.co.uk> >>

=head1 BUGS

=head1 SEE ALSO

L<LWP::UserAgent>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc LWP::Throttle

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=LWP-Throttle>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/LWP-Throttle>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/LWP-Throttle>

=item * Search CPAN

L<http://search.cpan.org/dist/LWP-Throttle/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2017 Nigel Horne.

This program is released under the following licence: GPL2

=cut

1; # End of LWP-Throttle
