<?php

namespace App\Http\Business;

use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\MatchesDataAccess;
use App\Http\DBO\MatchesDbo;

class MatchesBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new MatchesDataAccess();
    }
}