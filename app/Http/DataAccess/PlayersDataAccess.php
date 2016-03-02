<?php

namespace App\Http\DataAccess;

use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Players;
use App\Http\DBO\PlayersDbo;

class PlayersDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Players();
    }

    public static function getGround($player_id)
    {
        return 1;
    }
}