<?php
    /**
     * Creado para Sites.
     * Desarrollador: Alejandro Sosa <alesjohnson@hotmail.com>
     * Fecha: 1/1/17 - 18:12
     */

    require 'vendor/autoload.php';

    use Clases\Numeros;


    $a = 6;
    $b = 17;

    $obj = new Numeros();
    $resultado = $obj->sumar($a, $b);

    echo "La suma de $a + $b = $resultado \n";