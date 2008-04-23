use strict;

# ----------------------------------------------------------------------
# Makefile.PL for Shell::Base
# ----------------------------------------------------------------------

use ExtUtils::MakeMaker;

my %PREREQ_PM = (
    'Carp'              => 0,
    'Env'               => 0,
    'IO::File'          => 0,
    'Term::ReadLine'    => 0,
    'Term::Size::Any'   => 0,
    'Text::Shellwords'  => 0,
    'Text::Wrap'        => 0,
    'File::Slurp'       => 0, # needed only with T::RL::Perl
);

my %clean = (
    FILES => '$(DISTVNAME).tar$(SUFFIX) distdir',
);

my %dist = (
    PREOP => 'perldoc -t Base.pm > README; cpansign -s',
);

WriteMakefile(
    NAME        => "Shell::Base",
    VERSION     => "0.05",
    PREREQ_PM   => \%PREREQ_PM,
    clean       => \%clean,
    dist        => \%dist,
);

package MY;
use File::Basename qw(basename);

sub libscan {
    my ($self, $file) = @_;
    my $bfile = basename($file);

    return if $bfile =~ /\.swp$/;
    return if $bfile =~ /^\.(?:cvs)?ignore$/;

    return $self->SUPER::libscan($file);
}

