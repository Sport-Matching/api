<?php

/**
 * AUTO GENERATED BY LUTICATE GENERATOR
 * ANY CHANGES WILL BE OVERWRITTEN
 */

namespace App\Http\DBO;

use Luticate\Utils\LuDbo;

class GroundTypesDboArray extends LuDbo {

    /**
    * @var GroundTypesDbo[]
    */
    protected $_array;
    public function getArray()
    {
        return $this->_array;
    }
    public function setArray($value)
    {
        $this->_array = $value;
    }

    public function jsonSerialize()
    {
        return $this->_array;
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new GroundTypesDboArray();
        $array = [];
        foreach ($json as $data) {
            $array[] = GroundTypesDbo::jsonDeserialize($data);
        }
        $dbo->setArray($array);
        return $dbo;
    }

    public static function generateSample()
    {
        return [
            GroundTypesDbo::generateSample(),
            GroundTypesDbo::generateSample()
        ];
    }
}
