#!/usr/bin/perl
use warnings;
use strict;

use Module::Build;

Module::Build->new(
    module_name => 'URI::Find::Simple',
    license => 'perl',
    requires => {
        'perl' => '5.6.0',
        'Test::More' => 0,
        'URI::Find' => 0,
    },
    create_makefile_pl => 'traditional',
)->create_build_script;

