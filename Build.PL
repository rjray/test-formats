use strict;
use warnings;
use Module::Build;

our @tests = ();
# Get the tests that should be run, those in t, and the specified sub-dirs of t
opendir(my $dir, 't');
push(@tests,
     [ map { File::Spec->catfile('t', $_) }
        (sort grep /\.t$/, readdir($dir)) ]);
closedir($dir);
for my $subdir (qw(xml integration))
{
    opendir(my $dir, File::Spec->catfile('t', $subdir));
    push(@tests,
         [ map { File::Spec->catfile('t', $subdir, $_) }
            (sort grep /\.t$/, readdir($dir)) ]);
    closedir($dir);
}

my $builder = Module::Build->new(
    module_name          => 'Test::Formats',
    license              => 'perl',
    dist_author          => 'Randy J. Ray <rjray@blackperl.com>',
    dist_version         => '0.10',
    build_requires => {
        'File::Spec'   => '0.8',
        'XML::LibXML'  => '1.60',
        'Exporter'     => '5.57',
        'Test::Simple' => '0.80',
    },
    add_to_cleanup       => [ 'Test-Formats-*' ],
    create_makefile_pl   => 'traditional',
    recursive_test_files => 1,
    sign                 => 'here, please',
);

$builder->create_build_script();
