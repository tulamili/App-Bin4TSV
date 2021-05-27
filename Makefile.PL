use ExtUtils::MakeMaker;

WriteMakefile (
  NAME            => 'App::Bin4TSV' ,
  VERSION_FROM    => 'lib/App/Bin4TSV.pm' , 
  BUILD_REQUIRES => { 
    "Bin-Data-1D" => 0 ,
    "Bin-File-Dir" => 0 ,
    "Bin-File-Time" => 0 ,
    "Bin-Gen-Rand" => 0 ,
    "Bin-Subtotal" => 0 ,
    "Bin-TSV-Conv" => 0 ,
    "Bin-Text-Color-Plus" => 0
  }, 
  AUTHOR => 'Toshiyuki SHIMONO (bin4tsv at gmail.com)' , 
  LICENSE => 'perl_5' 
) ;
 
