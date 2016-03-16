<?php

namespace App\Http\DataAccess;

use App\Http\DataAccess\SP\SpGetPlayerFull;
use App\Http\DataAccess\SP\SpGetPlayers;
use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Players;
use App\Http\DBO\PlayersDbo;

class PlayersDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Players();
    }

    public static function getAll($page = 0, $perPage = 20000000, $query = "")
    {
        return SpGetPlayers::getMultipleJson($query, $page, $perPage);
    }

    public static function getFullById($player_id)
    {
        return SpGetPlayerFull::execute($player_id);
    }
}