#!/bin/sh
whoami

pwd
whoami
echo $1
echo $2
echo "`date` Usuario `whoami` inicio el script, opciones: rama $1 en el entorno $2."'\r' >> resultado.log
