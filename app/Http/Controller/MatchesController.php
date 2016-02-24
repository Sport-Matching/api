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
}