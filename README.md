[![Linux Build Status](https://travis-ci.org/nigelhorne/LWP-UserAgent-Throttled.svg?branch=master)](https://travis-ci.org/nigelhorne/LWP-UserAgent-Throttled)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/1t1yhvagx00c2qi8?svg=true)](https://ci.appveyor.com/project/nigelhorne/cgi-info)
[![Dependency Status](https://dependencyci.com/github/nigelhorne/LWP-UserAgent-Throttled/badge)](https://dependencyci.com/github/nigelhorne/LWP-UserAgent-Throttled)
[![Coverage Status](https://coveralls.io/repos/github/nigelhorne/LWP-UserAgent-Throttled/badge.svg?branch=master)](https://coveralls.io/github/nigelhorne/LWP-UserAgent-Throttled?branch=master)
[![CPAN](https://img.shields.io/cpan/v/LWP-UserAgent-Throttled.svg)](http://search.cpan.org/~nhorne/LWP-UserAgent-Throttled/)

# NAME

LWP::UserAgent::Throttled - Throttle requests to a site

# VERSION

Version 0.06.2

# SYNOPSIS

Some sites with REST APIs, such as openstreetmap.org, will blacklist you if you do too many requests.
LWP::UserAgent::Throttled is a sub-class of LWP::UserAgent.

    use LWP::UserAgent::Throttled;
    my $ua = LWP::UserAgent::Throttled->new();
    $ua->throttle({ 'www.example.com' => 5 });
    print $ua->get('http://www.example.com');
    sleep (2);
    print $ua->get('http://www.example.com');   # Will wait at least 3 seconds before the GET is sent

# SUBROUTINES/METHODS

## send\_request

See [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent).

## throttle

Get/set the number of seconds between each request for sites.

    my $ua = LWP::UserAgent::Throttled->new();
    $ua->throttle({ 'search.cpan.org' => 0.1, 'www.example.com' => 1 });
    print $ua->throttle('search.cpan.org'), "\n";    # prints 0.1
    print $ua->throttle('perl.org'), "\n";    # prints 0

# AUTHOR

Nigel Horne, `<njh at bandsman.co.uk>`

# BUGS

Please report any bugs or feature requests to `bug-lwp-useragent-throttled at rt.cpan.org`,
or through the web interface at
[http://rt.cpan.org/NoAuth/ReportBug.html?Queue=LWP-UserAgent-Throttled](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=LWP-UserAgent-Throttled).
I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

# SEE ALSO

[LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent)

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc LWP::UserAgent::Throttled

You can also look for information at:

- RT: CPAN's request tracker

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=LWP-UserAgent-Throttled](http://rt.cpan.org/NoAuth/Bugs.html?Dist=LWP-UserAgent-Throttled)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/LWP-UserAgent-Throttled](http://annocpan.org/dist/LWP-UserAgent-Throttled)

- CPAN Ratings

    [http://cpanratings.perl.org/d/LWP-UserAgent-Throttled](http://cpanratings.perl.org/d/LWP-UserAgent-Throttled)

- Search CPAN

    [http://search.cpan.org/dist/LWP-UserAgent-Throttled/](http://search.cpan.org/dist/LWP-UserAgent-Throttled/)

# LICENSE AND COPYRIGHT

Copyright 2017 Nigel Horne.

This program is released under the following licence: GPL2
