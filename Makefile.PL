use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME' => 'URI::Find::Simple',
    'VERSION_FROM' => 'lib/URI/Find/Simple.pm',
    'PREREQ_PM' => {
        'URI::Find' => 0,
        'Test::More' => 0
    }
);
