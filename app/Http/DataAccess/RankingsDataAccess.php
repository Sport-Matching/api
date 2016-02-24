<?php

namespace App\Http\DataAccess;

use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Rankings;
use App\Http\DBO\RankingsDbo;

class RankingsDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Rankings();
    }
}