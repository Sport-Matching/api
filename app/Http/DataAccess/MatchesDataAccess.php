<?php

namespace App\Http\DataAccess;

use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Matches;
use App\Http\DBO\MatchesDbo;

class MatchesDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Matches();
    }
}