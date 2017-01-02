<?php
/**
 * Created by PhpStorm.
 * User: alejandro
 * Date: 2/01/17
 * Time: 12:06
 */

namespace Clases\tests;

use Clases\Numeros;

class NumerosTest extends \PHPUnit_Framework_TestCase
{

    private $calculadora;

    public function setUp(){
        $this->calculadora = new Numeros();
    }

    public function tearDown(){
        $this->calculadora = null;
    }

    public function sumarDataProvider()
    {
        return [
            [1, 2, 3],
            [3, 2, 5],
            [10, 0, 10],
        ];
    }

    public function testExisteClaseNumeros(){
        $this->assertTrue(class_exists('Clases\Numeros'));
    }

    /**
     * @dataProvider sumarDataProvider
     */
    public function testSumar($a, $b, $expectativa)
    {
        $resultado = $this->calculadora->sumar($a, $b);
        $this->assertEquals($expectativa, $resultado);
    }
}
