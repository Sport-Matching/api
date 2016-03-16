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

    /**
     * Get all players basic information
     * @param int $page The page number, 0 based
     * @param int $perPage Items per page
     * @param string $query The filter query
     * @return null
     */
    public function getAll($page = 0, $perPage = 20000000, $query = "")
    {
        return PlayersBusiness::getAll($page, $perPage, $query);
    }

    /**
     * Get all matches for a player
     * @param $player_id int The player id
     * @param int $page The page number, 0 based
     * @param int $perPage Items per page
     * @return \Luticate\Utils\LuMultipleDbo
     */
    public function getMatches($player_id, $page = 0, $perPage = 20000000)
    {
        return PlayersBusiness::getMatches($player_id, $page, $perPage);
    }

    /**
     * Get full information about a player
     * @param $player_id int The player id
     * @return \Luticate\Utils\LuDbo
     */
    public function getFullById($player_id)
    {
        return PlayersBusiness::getFullById($player_id);
    }
}