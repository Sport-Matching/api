<?php

/**
 * AUTO GENERATED BY LUTICATE GENERATOR
 * ANY CHANGES WILL BE OVERWRITTEN
 */

namespace App\Http\DataAccess\SP;

use Luticate\Utils\LuSpDbo;
use Luticate\Utils\LuMultipleDbo;
use Luticate\Utils\LuStringUtils;
use Illuminate\Support\Facades\DB;

class SpGetPlayerAvgGamePerFirstSet extends LuSpDbo {

    /**
    * @param $dam
    * @return \App\Http\DataAccess\SP\SpGetPlayerAvgGamePerFirstSet|null
    */
    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpGetPlayerAvgGamePerFirstSet();

        $dbo->setAvg(LuStringUtils::convertJsonString($dam->avg));

        return $dbo;
    }


    /**
    * @param $player_id integer
    * @return \App\Http\DataAccess\SP\SpGetPlayerAvgGamePerFirstSet;
    */
    public static function execute($player_id)
    {
        $values = DB::select('SELECT to_json(data.avg) AS avg FROM sp_get_player_avg_game_per_first_set(:player_id) data', array(":player_id" => $player_id));
        return self::damToDbo($values[0]);
    }


    public function jsonSerialize()
    {
        return array(
            "Avg" => $this->_avg
        );
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new SpGetPlayerAvgGamePerFirstSet();
        if (isset($json["Avg"])) {
            $dbo->setAvg($json["Avg"]);
        }
        return $dbo;
    }

    public static function generateSample()
    {
        $dbo = new SpGetPlayerAvgGamePerFirstSet();
        $dbo->setAvg(42.42);
        return $dbo;
    }


    /**
    * @var double
    */
    protected $_avg;
    public function getAvg()
    {
        return $this->_avg;
    }
    public function setAvg($value)
    {
        $this->_avg = $value;
    }
}