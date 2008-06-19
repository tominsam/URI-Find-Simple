use ExtUtils::MakeMaker;
require 5.8.1;

WriteMakefile(
    'NAME' => 'URI::Find::Simple',
    'VERSION_FROM' => 'lib/URI/Find/Simple.pm',
    'PREREQ_PM' => {
        'URI::Find' => 0,
        'Test::More' => 0
    }
);
