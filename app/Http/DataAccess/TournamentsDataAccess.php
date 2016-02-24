<?php

namespace App\Http\DataAccess;

use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Tournaments;
use App\Http\DBO\TournamentsDbo;

class TournamentsDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Tournaments();
    }
}