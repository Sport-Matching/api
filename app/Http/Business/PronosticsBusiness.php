<?php

namespace App\Http\Business;

use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\PronosticsDataAccess;
use App\Http\DBO\PronosticsDbo;

class PronosticsBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new PronosticsDataAccess();
    }
}