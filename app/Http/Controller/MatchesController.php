<?php

namespace App\Http\Controller;

use Luticate\Utils\LuController;
use App\Http\Business\MatchesBusiness;
use App\Http\DBO\MatchesDbo;

class MatchesController extends LuController {
    protected function getBusiness()
    {
        return new MatchesBusiness();
    }
    
    public function getVs($player1_id, $player2_id, $page = 0, $perPage = 20000000)
    {
        return MatchesBusiness::getVs($player1_id, $player2_id, $page, $perPage);
    }
}