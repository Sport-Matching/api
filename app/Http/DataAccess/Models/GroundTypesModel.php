<?php

/**
 * AUTO GENERATED BY LUTICATE GENERATOR
 * ANY CHANGES WILL BE OVERWRITTEN
 * DO NOT DIRECTLY USE THIS FILE
 * USE GroundTypes.php
 * TO MAKE YOUR CHANGES AND DATABASE ACCESS
*/

namespace App\Http\DataAccess\Models;

use Luticate\Utils\LuModel;
use App\Http\DBO\GroundTypesDbo;

class GroundTypesModel extends LuModel
{
    function __construct()
    {
        parent::__construct();
        $this->timestamps = false;
    }

    public function toDbo()
    {
        $dbo = new GroundTypesDbo();

        $dbo->setId($this->id);
        $dbo->setName($this->name);

        return $dbo;
    }

    /**
     * @param $dbo GroundTypesDbo
     * @param $model LuModel|null
     * @return GroundTypes
     */
    public function fromDbo($dbo, $model = null)
    {
        if (is_null($model))
            $model = new GroundTypes();

        $model->id = $dbo->getId();
        $model->name = $dbo->getName();

        return $model;
    }
}