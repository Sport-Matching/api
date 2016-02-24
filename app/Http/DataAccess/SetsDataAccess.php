<?php

namespace App\Http\DataAccess;

use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Sets;
use App\Http\DBO\SetsDbo;

class SetsDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Sets();
    }
}