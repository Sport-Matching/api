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

    public function getMatches($player_id, $page = 0, $perPage = 20000000)
    {
        return PlayersBusiness::getMatches($player_id, $page, $perPage);
    }

    public function getById($player_id)
    {
        return PlayersBusiness::getById($player_id);
    }

    public function getGround($player_id)
    {
        return PlayersBusiness::getGround($player_id);
    }
}