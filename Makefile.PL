use ExtUtils::MakeMaker;

WriteMakefile (
  NAME            => 'App::Bin4TSV' ,
  VERSION_FROM    => 'lib/App/Bin4TSV.pm' , 
  BUILD_REQUIRES => { 'Bin::File::Dir' => 0  } , 
  AUTHOR => 'Toshiyuki SHIMONO (bin4tsv at gmail.com)' , 
  LICENSE => 'perl_5' 
) ;
 
