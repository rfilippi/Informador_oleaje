#SE CONCATENAN LOS DIFERENTES ARCHIVOS QUE COMPONEN EL INFORME
################################################################################################
################################################################################################
################################################################################################
my $ruta= '/media/DATOS/rodrigo/herramientas/informe_tecnico';
#Se abren los archivos
open FILEENCT,"+<",$ruta."/pedazos/encabezado_top.tex" or die $!;
open FILEENCB,"+<",$ruta."/pedazos/encabezado_bottom.tex" or die $!;
my @encatop=<FILEENCT>;
my @encabot=<FILEENCB>;

#Se ingresan los t�tulos
print "Nombre del Archivo\n";
my $filename=<STDIN>;
print "Titulo Largo\n";
my $titulong=<STDIN>;


print "Titulo Corto\n";
my $titushort=<STDIN>;
print "Region\n";
my $nregion=<STDIN>;

chomp($filename);
chomp($titulong);
chomp($titushort);

$filename="./" . $filename;

    if ($nregion==1){
    $region="Regi�n de Tarapac�";
}
    if ($nregion==2){
    $region="Regi�n de Antofagasta";
}
    if ($nregion==3){
    $region="Regi�n de Atacama";
}
    if ($nregion==4){
    $region="Regi�n de Coquimbo";
}
    if ($nregion==5){
    $region="Regi�n de Valparaiso";
}
    if ($nregion==6){
    $region="Regi�n del Libertador General Bernardo O'higgins";
}
    if ($nregion==7){
    $region="Regi�n del Maule";
}
    if ($nregion==8){
    $region="Regi�n del B�o - B�o";
}
    if ($nregion==9){
    $region="Regi�n de La Araucan�a";
}
    if ($nregion==10){
    $region="Regi�n de Los Lagos";
}
    if ($nregion==11){
    $region="Regi�n Ays�n del General Carlos Ib��ez del Campo";
}
    if ($nregion==12){
    $region="Regi�n de Magallanes y la Ant�rtica Chilena";
}
    if ($nregion==14){
    $region="Region de Los R�os";
}
    if ($nregion==15){
    $region="Regi�n de Arica y Parinacota ";

}



#Se abre el archivo del informe y se concatenan el encabezado y el cuerpo del informe
################################################################################################
################################################################################################
open FILEIN,">","./".$filename.".tex" or die $!;
print FILEIN  @encatop;
print FILEIN "\\newcommand{\\titulong}{" . $titulong . "}\n";
print FILEIN "\\newcommand{\\titushort}{" . $titushort . "}\n";
print FILEIN "\\newcommand{\\region}{" . $region . "}\n";
print FILEIN  @encabot;

close FILEENCT;
close FILEENCB;
close FILEIN;


