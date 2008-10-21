###############################################################################
#
#   $Id: Build.PL 5 2008-10-21 11:05:53Z rjray $
#
#   Module::Build file for Test::Formats
#
###############################################################################

use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name          => 'Test::Formats',
    license              => 'perl',
    dist_author          => 'Randy J. Ray <rjray@blackperl.com>',
    dist_version         => '0.11',
    build_requires       => {
        'Test::More' => '0.80',
    },
    requires             => {
        'File::Spec'   => '0.8',
        'XML::LibXML'  => '1.60',
        'Exporter'     => '5.57',
    },
    recommends           => {
        'Test::Pod'           => '0',
        'Test::Pod::Coverage' => '0',
    },
    add_to_cleanup       => [ 'Test-Formats-*' ],
    create_makefile_pl   => 'traditional',
    recursive_test_files => 1,
    sign                 => 'here, please',
);

$builder->create_build_script();

exit 0;
