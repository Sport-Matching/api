<?php

namespace App\Http\Business;

use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\RankingsDataAccess;
use App\Http\DBO\RankingsDbo;

class RankingsBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new RankingsDataAccess();
    }
}