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

    public static function findOnePlayer($query)
    {
        $players = self::getAll(0, 1, $query);
        if (count($players->getData()) >= 1) {
            return $players->getData()[0];
        }
        return null;
    }

    public static function getFullById($player_id)
    {
        return PlayersDataAccess::getFullById($player_id);
    }
}