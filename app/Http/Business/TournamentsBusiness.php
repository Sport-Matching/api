<?php

namespace App\Http\Business;

use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\TournamentsDataAccess;
use App\Http\DBO\TournamentsDbo;

class TournamentsBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new TournamentsDataAccess();
    }
}