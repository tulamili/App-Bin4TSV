use ExtUtils::MakeMaker;

WriteMakefile (
  NAME            => 'App::Bin4TSV' ,
  VERSION_FROM    => 'lib/App/Bin4TSV.pm' , 
  BUILD_REQUIRES => { 
    "Bin-Data-1D" =>  0.120 ,
    "Bin-File-Dir" => 0.202 ,
    "Bin-File-Time" => 0.200 ,
    "Bin-Gen-Rand" => 0.100 ,
    "Bin-Subtotal" => 0.200 ,
    "Bin-TSV-Conv" => 0.300 ,
    "Bin-Text-Color-Plus" => 0.051
  }, 
  AUTHOR => 'Toshiyuki SHIMONO (bin4tsv at gmail.com)' , 
  LICENSE => 'perl_5' 
) ;
 
