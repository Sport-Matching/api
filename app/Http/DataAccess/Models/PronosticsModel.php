<?php

/**
 * AUTO GENERATED BY LUTICATE GENERATOR
 * ANY CHANGES WILL BE OVERWRITTEN
 * DO NOT DIRECTLY USE THIS FILE
 * USE Pronostics.php
 * TO MAKE YOUR CHANGES AND DATABASE ACCESS
*/

namespace App\Http\DataAccess\Models;

use Luticate\Utils\LuModel;
use App\Http\DBO\PronosticsDbo;

class PronosticsModel extends LuModel
{
    function __construct()
    {
        parent::__construct();
        $this->timestamps = false;
    }

    public function toDbo()
    {
        $dbo = new PronosticsDbo();

        $dbo->setMatchId($this->match_id);
        $dbo->setMatchWinnerNumber($this->match_winner_number);
        $dbo->setSet1WinnerNumber($this->set1_winner_number);

        return $dbo;
    }

    /**
     * @param $dbo PronosticsDbo
     * @param $model LuModel|null
     * @return Pronostics
     */
    public function fromDbo($dbo, $model = null)
    {
        if (is_null($model))
            $model = new Pronostics();

        $model->match_id = $dbo->getMatchId();
        $model->match_winner_number = $dbo->getMatchWinnerNumber();
        $model->set1_winner_number = $dbo->getSet1WinnerNumber();

        return $model;
    }
}