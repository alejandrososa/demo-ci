#!/bin/bash
#pwd
#whoami
#echo $1
#echo $2
#echo "`date` Usuario `whoami` inicio el script, opciones: rama $1 en el entorno $2."'\r' >> resultado.log

#constantes
RAMA_ROLLBACK="rollback"
RAMA_DEVELOP="develop"
RAMA_MASTER="master"
ENTORNO_PRE="pre"
ENTORNO_PRO="pro"
RUTA_ENTORNO_PRE="/var/www/html/demo-ci-pre/"
RUTA_ENTORNO_PRO="/var/www/html/demo-ci-pro/"

#parametros entrantes
inputRama=$1
inputEntorno=$2

#metodos

# Despliega version en entorno pre
# @param $inputRama string
despliegueVersion () {
    rama=$1
    rutaProyecto=$2
    mensaje=$3

    if [ -z $mensaje ]; then
        mensaje="\033[92mOK. Se ha desplegado $rama en $ENTORNO_PRE"
    fi

    if [ ! -z "$rama" ]; then
        cd $rutaProyecto
        git fetch --all
        git reset --hard origin/$rama
        git pull origin $rama
        echo $mensaje
    fi
}



selectEntorno () {
    case $2 in
      $ENTORNO_PRE)
         despliegueVersion $inputRama $RUTA_ENTORNO_PRE
      ;;
      $ENTORNO_PRO)
         despliegueVersion $inputRama $RUTA_ENTORNO_PRO
      ;;
      *)
         echo "Opciones invalidas $1 $2:"
      ;;
    esac
}



#despliegue en entornos
selectEntorno $inputRama $inputEntorno
