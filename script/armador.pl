#SE CONCATENAN LOS DIFERENTES ARCHIVOS QUE COMPONEN EL INFORME
################################################################################################
################################################################################################
################################################################################################
my $ruta= '/home/rodrigo/herramientas/informe_oleaje/informador_v2_1';
#Se abre elarchivo encabezado


open FILEENCT,"+<",$ruta."/pedazos/encabezado_top.tex" or die $!;
open FILEENCB,"+<",$ruta."/pedazos/encabezado_bottom.tex" or die $!;
my @encatop=<FILEENCT>;
my @encabot=<FILEENCB>;

print $ruta."/pedazos/encabezado_top.tex\n";
#Se ingresan los títulos
print "Prueba";
print "Nombre del Archivo\n";
my $filename=<STDIN>;
print "Nombre de la Consultoría\n";
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
    $region="Regi\\'on de Tarapacá";
}
    if ($nregion==2){
    $region="Regi\\'on de Antofagasta";
}
    if ($nregion==3){
    $region="Regi\\'on de Atacama";
}
    if ($nregion==4){
    $region="Regi\\'on de Coquimbo";
}
    if ($nregion==5){
    $region="Regi\\'on de Valparaiso";
}
    if ($nregion==6){
    $region="Regi\\'on del Libertador General Bernardo O'higgins";
}
    if ($nregion==7){
    $region="Regi\\'on del Maule";
}
    if ($nregion==8){
    $region="Regi\\'on del B'io - B'io";
}
    if ($nregion==9){
    $region="Regi\\'on de La Araucan'ia";
}
    if ($nregion==10){
    $region="Regi\\'on de Los Lagos";
}
    if ($nregion==11){
    $region="Regi\\'on Ays'en del General Carlos Ibáñez del Campo";
}
    if ($nregion==12){
    $region="Regi\\'on de Magallanes y la Antártica Chilena";
}
    if ($nregion==14){
    $region="Regi\\'on de Los R'ios";
}
    if ($nregion==15){
    $region="Regi\\'on de Arica y Parinacota ";

}



#Se abre el archivo del informe y se concatenan el encabezado y el cuerpo del informe
################################################################################################
################################################################################################
open FILEIN,">","./".$filename.".tex" or die $!;
#print FILEIN  @encatop;
#print FILEIN "\\newcommand{\\titulong}{" . $titulong . "}\n";
#print FILEIN "\\newcommand{\\titushort}{" . $titushort . "}\n";
#print FILEIN "\\newcommand{\\region}{" . $region . "}\n";
#print FILEIN  @encabot;
#

my @encabezado=( @encatop, "\\newcommand{\\titulong}{" . $titulong . "}\n", "\\newcommand{\\titushort}{" . $titushort . "}\n", "\\newcommand{\\region}{" . $region . "}\n", @encabot);




#open FILEENC,"+<",$ruta."/pedazos/encabezado.tex" or die $!;
#open FILETIT,"+<",$ruta."/pedazos/titulo.tex" or die $!;
open FILECUE,"+<",$ruta."/pedazos/cuerpo.tex" or die $!;
#my @encabezado=<FILEENC>;
my @titulo=<FILETIT>;
my @cuerpo=<FILECUE>;

#Se abre el archivo del informe y se concatenan el encabezado y el cuerpo del informe
################################################################################################
################################################################################################
#open FILEIN,">","./informe_trans_esp.tex" or die $!;
print   @encabezado;
print FILEIN  @encabezado;
#print FILEIN  @titulo;
print FILEIN  @cuerpo;




#SE AGREGA LA UBICACIÓN DE LOS NODOS
################################################################################################
################################################################################################
#Se abre el archivo de la ubicación de los nodos
open FILEUBI,"+<" ,"./pos_nodo_ana.txt" or die $!;
my @posnodo=<FILEUBI>;

foreach  (@posnodo) {    					#ciclo que recorre el arreglo con las ubicaciones

	@cadanodo=split(/\t/);
	print $cadanodo[1]."\n";
	my $nodox=sprintf '%.0f', $cadanodo[1];
	my $nodoy=sprintf '%.0f', $cadanodo[2];
	my $nodocota=sprintf '%.0f', $cadanodo[3];
	my $nodoname= $cadanodo[0];
	$nodoname =~ s/nodo/Nodo /g;
	
	print $nodoname."\t".$nodox ."\t".$nodoy ."\t".$nodocota ."\n";
	print FILEIN $nodoname." & ".$nodox ." & ".$nodoy ." & ".$nodocota .'\\\\ \hline'."\n";
}

#SE AGREGA DIRECTAMENTE UN PEQUEÑO TROZO AL INFORME
print FILEIN "\\end{tabular}\\\\"."\n";
print FILEIN "\\end{center}"."\n";
print FILEIN ""."\n";
print FILEIN "A continuaci\'on se presentan los resultados de los nodos anteriormente expuesto. "."\n";
print FILEIN ""."\n";
print FILEIN "Para la construcci\\'on de las tablas se usaron los par\\'ametros de resumen de los 21 a\\~nos de estad\\'istica obtenidos."."\n";
print FILEIN "\\newpage"."\n";


foreach  (@posnodo) {    					#ciclo que recorre el arreglo con las ubicaciones
	@cadanodo=split(/\t/);
	my $nodoname= $cadanodo[0];
	print FILEIN '\\input{'.$cadanodo[0].'}'."\n";
}

print FILEIN "\\end{document}"."\n";



close FILEIN;;
close FILEENC;
close FILETIT;
close FILECUE;
