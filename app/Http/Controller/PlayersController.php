<?php

namespace App\Http\Controller;

use Luticate\Utils\LuController;
use App\Http\Business\PlayersBusiness;
use App\Http\DBO\PlayersDbo;

class PlayersController extends LuController {
    protected function getBusiness()
    {
        return new PlayersBusiness();
    }
}