#SE LEEN LOS ARCHIVOS PENDIENTES.FLP Y DIARIO.FLP y se construye el archivo date_agendax_00.tex
################################################################################################
################################################################################################
################################################################################################

use DateTime;

#Se abre elarchivo pendientes.flp
open FILEP,"+<","../taco/pendientes.flp" or die $!;
my @pendientes=<FILEP>;
print @pendientes;

#SE GENERA DATE_AGENDAX_V.TEX
################################################################################################
################################################################################################
################################################################################################

#Se genera el nombre del archivo date_agendax_00.tex
################################################################################################
my $dt = DateTime->today;
my $fecha = $dt->date;
my $filename= "../".$fecha."_agendax.tex";
print $fecha."\n";
print $filename."\n";

#Se escriben los datos fijos del tex en el archivo
open FILEAX,">",$filename or die $!;

print FILEAX  "\\documentclass[11pt,spanish]{article}"."\n";
print FILEAX  "\\usepackage[T1]{fontenc}"."\n";
print FILEAX  "\\usepackage{selinput}"."\n";
print FILEAX  "\\SelectInputMappings{%"."\n";
print FILEAX  "  aacute={á},"."\n";
print FILEAX  "  ntilde={ñ},"."\n";
print FILEAX  "  Euro={€}"."\n";
print FILEAX  "}"."\n";
print FILEAX  "\\usepackage{babel}"."\n";
print FILEAX  "\\usepackage[usenames]{color}"."\n";
print FILEAX  "\\usepackage{dcolumn}"."\n";
print FILEAX  "\\title{\\color{Blue}Actividades}"."\n";
print FILEAX  "\\author{Filippi}"."\n";
print FILEAX  "\\pagestyle{plain}"."\n";
print FILEAX  "\\setlength{\\parindent}{0pt}"."\n";
print FILEAX  "\\setlength{\\parskip}{2.0ex plus 0.6ex minus 0.4ex}"."\n";
print FILEAX  "\\begin{document}"."\n";
#print FILEAX  "\\makeatletter"."\n";
#print FILEAX  "\\\@date"."\n";
#print FILEAX  "\\makeatother"."\n";
print FILEAX  "\\maketitle"."\n";
print FILEAX  "\\begin{center}"."\n";
print FILEAX  "{\\color{Brown}"."\n";
print FILEAX  "{\\Large Pendiendtes}"."\n";
print FILEAX  "}"."\n";
print FILEAX  "\\end{center}"."\n";
print FILEAX  "\n";
print FILEAX  "{\\color{BlueViolet}"."\n";
print FILEAX  "\\begin{tabular}{|l|p{10cm}|c|}\\hline"."\n";
print FILEAX  "\\textbf{Nombre} & \\textbf{Descripción} & \\textbf{Fecha}\\\\\\hline"."\n";


#Se escriben los PENDIENTES en el archivo
foreach $pendientes(@pendientes){
    print FILEAX $pendientes,"\\\\\\hline"."\n";
}
print FILEAX  "\\end{tabular}"."\n";
print FILEAX  "\}"."\n";

print FILEAX  "\\vspace{2cm}\n";
print FILEAX  "\\newpage\n"                                                           ;
print FILEAX  "\\begin{center}"."\n";
print FILEAX  "{\\Large Actividades del día}\n"                                       ;
print FILEAX  "{\\color{OrangeRed}\n"                                                 ;
print FILEAX  "\}\n"                                                                    ;
print FILEAX  "\\end{center}"."\n";
print FILEAX  "\n"                                                                    ;
print FILEAX  "\\begin{tabular}{|l|p{10cm}|c|}\\hline\n"                              ;
print FILEAX  "\\multicolumn{3}{|c|}{\\textbf{Mañana}}\\\\\\hline\n"                  ;
print FILEAX  "\\textbf{Nombre} & \\textbf{Descripción} & \\textbf{Hora}\\\\\\hline\n";


#Se abre el archivo para actividades del día AM
open FILEDAM,"+<","../taco/diaam.flp" or die $!;
my @diaam=<FILEDAM>;
print @diaam;
foreach $diaam(@diaam){
    print FILEAX $diaam,"\\\\\\hline"."\n";
}
close FILEDAM;

print FILEAX  "\\end{tabular}\n";
print FILEAX  "\n";
print FILEAX  "\{\\color{RawSienna}\n";
print FILEAX  "\\begin{tabular}{|l|p{10cm}|c|}\\hline\n";
print FILEAX  "\\multicolumn{3}{|c|}{\\textbf{Tarde}}\\\\\\hline\n";
print FILEAX  "\\textbf{Nombre} & \\textbf{Descripción} & \\textbf{Hora}\\\\\\hline\n";


#Se abre el archivo para actividades del día PM
open FILEDPM,"+<","../taco/diapm.flp" or die $!;
my @diapm=<FILEDPM>;
print @diapm;
foreach $diapm(@diapm){
    print FILEAX $diapm,"\\\\\\hline"."\n";
}
close FILEDPM;


print FILEAX  "\\end{tabular}\n";
print FILEAX  "\}\n";
print FILEAX  "\\end{document}"."\n";
close FILEAX;

