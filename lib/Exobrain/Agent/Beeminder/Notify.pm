package Exobrain::Agent::Beeminder::Notify;

use Exobrain;
use Moose;
use Method::Signatures;

# ABSTRACT: Send a notification every time a bmndr data point is updated
our $VERSION = '1.00'; # VERSION

with 'Exobrain::Agent::Run';

method run() {
    $self->exobrain->watch_loop(
        class => 'Measurement::Beeminder',
        then => sub {
            $self->exobrain->notify($_->summary);
        },
    );
}

1;

__END__

=pod

=head1 NAME

Exobrain::Agent::Beeminder::Notify - Send a notification every time a bmndr data point is updated

=head1 VERSION

version 1.00

=head1 AUTHOR

Paul Fenwick <pjf@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Paul Fenwick.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
