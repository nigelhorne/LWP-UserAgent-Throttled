# LWP::UserAgent::Throttled

Throttle requests to a site

# VERSION

Version 0.01

# SYNOPSIS

Some sites with REST APIs, such as openstreetmap.org, will blacklist you if you do too many requests.

    use LWP::UserAgent::Throttled;
    my $ua = LWP::UserAgent::Throttled->new();
    $ua->load(5);
    print $ua->get('http://www.example.com');
    sleep (2);
    print $ua->get('http://www.example.com');   # Will wait at least 3 seconds before the GET is sent

# SUBROUTINES/METHODS

## new

Creates a LWP::UserAgent::Throttled object.

## send\_request

See [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent).

## load

Get/set the number of seconds between each request. The default is one second.

# AUTHOR

Nigel Horne, `<njh at bandsman.co.uk>`

# BUGS

# SEE ALSO

[LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent)

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc LWP::Throttle

You can also look for information at:

- RT: CPAN's request tracker

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=LWP-Throttle](http://rt.cpan.org/NoAuth/Bugs.html?Dist=LWP-Throttle)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/LWP-Throttle](http://annocpan.org/dist/LWP-Throttle)

- CPAN Ratings

    [http://cpanratings.perl.org/d/LWP-Throttle](http://cpanratings.perl.org/d/LWP-Throttle)

- Search CPAN

    [http://search.cpan.org/dist/LWP-Throttle/](http://search.cpan.org/dist/LWP-Throttle/)

# LICENSE AND COPYRIGHT

Copyright 2017 Nigel Horne.

This program is released under the following licence: GPL2
