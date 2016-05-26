<?php
/**
 * Created by PhpStorm.
 * User: ZHAJOR
 * Date: 5/25/16
 * Time: 5:30 PM
 */

namespace App\Http\DataAccess;


use App\Http\DataAccess\SP\SpExportPlayers;
use Luticate\Utils\LuDataAccess;

class StatistiquesDataAccess extends LuDataAccess
{
    public static function prediction($j1, $j2, $date)
    {
        return SpExportPlayers::getMultipleJson($j1, $j2, $date, 0, 1000);
    }
}