version = '0.0.2'
from scipy.io import FortranFile
from matplotlib import colors, ticker, cm
import numpy as np
import re as re
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from mpl_toolkits.mplot3d import Axes3D
import subprocess #as sbp
print("88888888888888888888888888888888888888888")
print("88888888888888888888888888888888888888888")
print("88888888888888888888888888888888888888888")
print("88888888888888888888888888888888888888888")
print("     HHHHH      ")
print("    HHHHHHH     ")
print("   HH HHH HH    ")
print("   HHHHHHHHH    ")
print("   HH HHHH H    ")
print("    HH    H     ")
print("     HHHHH      ")
print("       H        ")
print("   HHHHHHHHHH   ")
print("       H        ")
print("       H        ")
print("       H        ")
print("       H        ")
print("       H        ")
print("       H        ")
print("      H H       ")
print("     H   H      ")
print("88888888888888888888888888888888888888888")
print("88888888888888888888888888888888888888888")
print("88888888888888888888888888888888888888888")
print("88888888888888888888888888888888888888888")
print("BIENVENIDO AL SUPERHIPERMEGAPRORAMA DE TRANSFORMACION DE XYZ A KML      ")
#print("Este programa pasara tu archivo xyz a kml")
print("Los xyz deben estar en UTM")

#ndato=input("INGRESE EL NOMBRE DEL ARCHIVO XYZ CON SU EXTENSION:  ")
ndato="pos_nodo_ana.txt"
ndato=str(ndato)
dxyz=np.loadtxt(ndato, usecols=(1,2,3))
#dxyz=dxyz.array
#dxyz=np.genfromtxt(ndato, dtype={'str', 'f4', 'f4', 'f4'})
namenodo=np.genfromtxt(ndato, dtype='str')
print(dxyz)
print(namenodo)
huso=input("INGRESE EL HUSO DE SUS DATOS (Al norte son 19 y al sur 18:  ")
#huso="19"
ndato=len(dxyz)
print(ndato)
print(dxyz.shape)
for i in range(0,ndato):
 	print("Contador: " + str(i))
	[nombre, ncx, ncy, ncz]=[namenodo[i,0], dxyz[i,0], dxyz[i,1], dxyz[i,2]]
	print("entradas")
	print(nombre,ncx,ncy,ncz)
	#dummy1=input("stop")	
#SE HABRE EL ARCHIVO KML PARA ESCRIBIR EN EL
	namefile=nombre+ ".kml"
	print("namefile")
	print(namefile)
	cx=str(ncx)
	cy=str(ncy)
	cz=str(ncz)
	huso=str(huso)
	print(cx + cy + cz)
        bash_cmd="-d WGS84 -h " + huso +" -z S " + cx +" "+ cy #+ " > temp"
	print(bash_cmd)
#	os.system(bash_cmd)
	proc = subprocess.Popen(['utm2geo_func', bash_cmd], 
                        stdout=subprocess.PIPE,
                        )
	stdout_value = proc.communicate()[0]
	print("stdout_value")
	print(stdout_value)
	ftmp = open("temp", "w")
	ftmp.write(stdout_value)
	ftmp.close
#	output = sbp.check_output(bash_cmd)
# 	preuba=np.loadtxt("temp")
#	coor=np.array(preuba)
	coor=np.array(stdout_value)
	print("coor")	
	coor=np.array(coor)
	coor=str(coor)
	coor=coor.split(' ')
	print(coor)	
	coor=np.array(coor)
	print(coor.shape)	
	print(coor)	
	print("coor")	
	if i >= 0:
		ncx=coor[1]
		ncy=coor[0]
		cx=str(ncx)
		cy=str(ncy)
		print("ncx= " + cx+ "ncy= " + cy)

		print(namefile)
		file = open(namefile, "w")
	#        open (kml,(">".$nfile));
		file.write(  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
		file.write(  "<kml xmlns=\"http://www.opengis.net/kml/2.2\" xmlns:gx=\"http://www.google.com/kml/ext/2.2\" xmlns:kml=\"http://www.opengis.net/kml/2.2\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n")
		file.write(  "<Document>\n")
		file.write(  "	<name>" + nombre + "</name>\n")
		file.write(  "	<StyleMap id=\"msn_ylw-pushpin\">\n")
		file.write(  "		<Pair>\n")
		file.write(  "			<key>normal</key>\n")
		file.write(  "			<styleUrl>#sn_ylw-pushpin</styleUrl>\n")
		file.write(  "		</Pair>\n")
		file.write(  "		<Pair>\n")
		file.write(  "			<key>highlight</key>\n")
		file.write(  "			<styleUrl>#sh_ylw-pushpin</styleUrl>\n")
		file.write(  "		</Pair>\n")
		file.write(  "	</StyleMap>\n")
		file.write(  "	<Style id=\"sh_ylw-pushpin\">\n")
		file.write(  "		<IconStyle>\n")
		file.write(  "			<scale>0.5</scale>\n")
		file.write(  "			<Icon>\n")
		file.write(  "				<href>http://maps.google.com/mapfiles/kml/shapes/placemark_circle.png</href>\n")
#		file.write(  "				<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>\n")
		file.write(  "			</Icon>\n")
		file.write(  "			<hotSpot x=\"20\" y=\"2\" xunits=\"pixels\" yunits=\"pixels\"/>\n")
		file.write(  "		</IconStyle>\n")
		file.write(  "	</Style>\n")
		file.write(  "	<Style id=\"sn_ylw-pushpin\">\n")
		file.write(  "		<IconStyle>\n")
		file.write(  "			<scale>0.5</scale>\n")
		file.write(  "			<Icon>\n")
		file.write(  "				<href>http://maps.google.com/mapfiles/kml/shapes/placemark_circle.png</href>\n")
#		file.write(  "				<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>\n")
		file.write(  "			</Icon>\n")
		file.write(  "			<hotSpot x=\"20\" y=\"2\" xunits=\"pixels\" yunits=\"pixels\"/>\n")
		file.write(  "		</IconStyle>\n")
		file.write(  "	</Style>\n")
		file.write(  "	<Placemark>\n")
		file.write(  "		<name>" + nombre + "</name>\n")
		file.write(  "		<LookAt>\n")
		file.write(  "			<longitude>" + cx + "</longitude>\n")
		file.write(  "			<latitude>" + cy + "</latitude>\n")
		file.write(  "			<altitude>0</altitude>\n")
		file.write(  "			<heading>0.1169845446570804</heading>\n")
		file.write(  "			<tilt>0</tilt>\n")
		file.write(  "			<range>1480229.459656536</range>\n")
		file.write(  "			<altitudeMode>relativeToGround</altitudeMode>\n")
		file.write(  "			<gx:altitudeMode>relativeToSeaFloor</gx:altitudeMode>\n")
		file.write(  "		</LookAt>\n")
		file.write(  "		<styleUrl>#msn_ylw-pushpin</styleUrl>\n")
		file.write(  "		<Point>\n")
		file.write(  "			<altitudeMode>clampToGround</altitudeMode>\n")
		file.write(  "			<gx:altitudeMode>clampToSeaFloor</gx:altitudeMode>\n")
		file.write(  "			<coordinates>" + cx + "," + cy + "</coordinates>\n")
		file.write(  "		</Point>\n")
		file.write(  "	</Placemark>\n")
		file.write(  "</Document>\n")
		file.write(  "</kml>\n")
		file.close
#		gueit=input("pera"#)
#     }
# 
##
#
#	proc = subprocess.Popen(['rm', 'temp'], 
#                        stdout=subprocess.PIPE,
#                        )
#os.system("rm temp")

