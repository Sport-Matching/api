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

    public static function getVs($player1_id, $player2_id, $page = 0, $perPage = 20000000)
    {
        return MatchesDataAccess::getVs($player1_id, $player2_id, $page, $perPage);
    }
}