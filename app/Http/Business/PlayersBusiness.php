<?php

namespace App\Http\Business;

use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\PlayersDataAccess;
use App\Http\DBO\PlayersDbo;

class PlayersBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new PlayersDataAccess();
    }
}