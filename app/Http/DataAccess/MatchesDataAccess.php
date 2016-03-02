<?php

namespace App\Http\DataAccess;

use App\Http\DataAccess\SP\SpGetMatchesByPlayer;
use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Matches;
use App\Http\DBO\MatchesDbo;

class MatchesDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Matches();
    }

    public static function getMatchesByPlayer($player_id, $page = 0, $perPage = 20000000)
    {
        return SpGetMatchesByPlayer::getMultipleJson($player_id, $page, $perPage);
    }
}