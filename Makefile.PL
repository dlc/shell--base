use strict;

use ExtUtils::MakeMaker;

my %PREREQ_PM = (
    'Carp'              => undef,
    'Env'               => undef,
    'IO::File'          => undef,
    'Term::ReadLine'    => undef,
    'Text::Shellwords'  => undef,
    'Text::Wrap'        => undef,
);

my %clean = (
    FILES => '$(DISTVNAME).tar$(SUFFIX) *.asc distdir',
);

my %macro = (
    'GPG'    => 'gpg',
    'AUTHOR' => 'darren@cpan.org',
    'SIGN'   => '--detach-sign --armor',
);

WriteMakefile(
    NAME         => "Shell::Base",
    VERSION_FROM => "Base.pm",
    PREREQ_PM    => \%PREREQ_PM,
    macro        => \%macro,
    clean        => \%clean,
);

package MY;
sub dist_dir {
    my $self = shift;
    my $stuff = $self->SUPER::dist_dir(@_);

    return "$stuff\ttouch distdir\n\n";
}

sub postamble {
    return <<'P';
distsign :: $(DISTVNAME).tar$(SUFFIX)
	$(GPG) $(SIGN) -u $(AUTHOR) $(DISTVNAME).tar$(SUFFIX)
	@cat $(DISTVNAME).tar$(SUFFIX).asc
P
}
