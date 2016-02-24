<?php

namespace App\Http\DataAccess;

use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Pronostics;
use App\Http\DBO\PronosticsDbo;

class PronosticsDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Pronostics();
    }
}