#!perl
use Mojo::Base -strict;
use Mojo::Log;
use Test::More;

my $log = Mojo::Log->with_roles('+Color')->new;

ok $log->does('Mojo::Log::Role::Color'), 'role applied';

done_testing;
