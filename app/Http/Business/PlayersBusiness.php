<?php

namespace App\Http\Business;

use App\Http\DataAccess\MatchesDataAccess;
use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\PlayersDataAccess;
use App\Http\DBO\PlayersDbo;

class PlayersBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new PlayersDataAccess();
    }

    public static function getMatches($player_id, $page = 0, $perPage = 20000000)
    {
        self::getById($player_id);
        return MatchesDataAccess::getMatchesByPlayer($player_id, $page, $perPage);
    }

    public static function getGround($player_id)
    {
        self::getById($player_id);
        return PlayersDataAccess::getGround($player_id);
    }
}