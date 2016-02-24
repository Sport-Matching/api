<?php

namespace App\Http\Controller;

use Luticate\Utils\LuController;
use App\Http\Business\TournamentsBusiness;
use App\Http\DBO\TournamentsDbo;

class TournamentsController extends LuController {
    protected function getBusiness()
    {
        return new TournamentsBusiness();
    }
}