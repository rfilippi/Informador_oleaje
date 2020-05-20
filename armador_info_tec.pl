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

#Se ingresan los títulos
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
    $region="Región de Tarapacá";
}
    if ($nregion==2){
    $region="Región de Antofagasta";
}
    if ($nregion==3){
    $region="Región de Atacama";
}
    if ($nregion==4){
    $region="Región de Coquimbo";
}
    if ($nregion==5){
    $region="Región de Valparaiso";
}
    if ($nregion==6){
    $region="Región del Libertador General Bernardo O'higgins";
}
    if ($nregion==7){
    $region="Región del Maule";
}
    if ($nregion==8){
    $region="Región del Bío - Bío";
}
    if ($nregion==9){
    $region="Región de La Araucanía";
}
    if ($nregion==10){
    $region="Región de Los Lagos";
}
    if ($nregion==11){
    $region="Región Aysén del General Carlos Ibáñez del Campo";
}
    if ($nregion==12){
    $region="Región de Magallanes y la Antártica Chilena";
}
    if ($nregion==14){
    $region="Region de Los Ríos";
}
    if ($nregion==15){
    $region="Región de Arica y Parinacota ";

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


