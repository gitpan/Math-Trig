use ExtUtils::MakeMaker;
use Config;

$Version = '0.01';

WriteMakefile(
               'NAME'     => 'Math::Trig',
               'LINKTYPE' => '$(INST_PM)',
               'VERSION'  => $Version,
               'dist'     => { SUFFIX => 'gz', COMPRESS => 'gzip -f' },
               'clean' 	  => {'FILES' => '*~'},
);
