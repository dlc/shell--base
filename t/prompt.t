#!/usr/bin/perl -w
# vim: set ft=perl:

use strict;

use Test::More;
use Shell::Base;

plan tests => 4;

use_ok("Shell::Base");

my $shell = Shell::Base->new;
is($shell->prompt, '(Shell::Base) $ ', "default prompt");
is($shell->prompt('foo $ '), 'foo $ ', "custom prompt");
is($shell->prompt, 'foo $ ', "custom prompt");

