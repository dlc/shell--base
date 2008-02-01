#!/usr/bin/perl -w
# vim: set ft=perl:

use strict;

use Test::More;
use Shell::Base;

plan tests => 3;

use_ok("Shell::Base");

my $shell = Shell::Base->new;
my $term = $shell->term;
ok(defined $term, '$self->term() returns something useful');

# It would be nice if a Term::ReadLine::* instance
# could be tested only by asking if $term->isa('Term::ReadLine')
# but it not that simple. It works for Term::ReadLine::Gnu
# but not for Term::ReadLine::Perl.
# That explains the convoluted test below.

like(ref $term, '/\ATerm::ReadLine/', '$self->term() returns something readline-ish');
# this might help failure diagnostics
diag( "using ", $term->ReadLine );
