
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Get full exception objects from DBI',
  'AUTHOR' => 'Arthur Axel "fREW" Schmidt <frioux+cpan@gmail.com>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'DBIx-Exceptions',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'DBIx::Exceptions',
  'PREREQ_PM' => {
    'Carp' => '0',
    'DBD::SQLite' => '0',
    'DBI' => '0',
    'Exception::Class' => '0',
    'JSON' => '0',
    'Moo' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0.94',
    'Try::Tiny' => '0',
    'parent' => '0'
  },
  'VERSION' => '0.001000_03',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



