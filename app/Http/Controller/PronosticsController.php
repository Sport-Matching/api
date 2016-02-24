<?php

namespace App\Http\Controller;

use Luticate\Utils\LuController;
use App\Http\Business\PronosticsBusiness;
use App\Http\DBO\PronosticsDbo;

class PronosticsController extends LuController {
    protected function getBusiness()
    {
        return new PronosticsBusiness();
    }
}