<?php

namespace App\Http\Controller;

use Luticate\Utils\LuController;
use App\Http\Business\RankingsBusiness;
use App\Http\DBO\RankingsDbo;

class RankingsController extends LuController {
    protected function getBusiness()
    {
        return new RankingsBusiness();
    }
}