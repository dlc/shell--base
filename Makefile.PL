use strict;

use ExtUtils::MakeMaker;

my %PREREQ_PM = (
    'Carp'              => 0,
    'Env'               => 0,
    'IO::File'          => 0,
    'Term::ReadLine'    => 0,
    'Text::Shellwords'  => 0,
    'Text::Wrap'        => 0,
);

my %clean = (
    FILES => '$(DISTVNAME).tar$(SUFFIX) distdir',
);

WriteMakefile(
    NAME         => "Shell::Base",
    VERSION_FROM => "Base.pm",
    PREREQ_PM    => \%PREREQ_PM,
    clean        => \%clean,
);
