<?php

namespace App\Http\Business;

use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\SetsDataAccess;
use App\Http\DBO\SetsDbo;

class SetsBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new SetsDataAccess();
    }
}