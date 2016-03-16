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

class SpGetPlayerWinFirstSetCount extends LuSpDbo {

    /**
    * @param $dam
    * @return \App\Http\DataAccess\SP\SpGetPlayerWinFirstSetCount|null
    */
    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpGetPlayerWinFirstSetCount();

        $dbo->setPercent(LuStringUtils::convertJsonString($dam->percent));

        return $dbo;
    }


    /**
    * @param $player_id integer
    * @return \App\Http\DataAccess\SP\SpGetPlayerWinFirstSetCount;
    */
    public static function execute($player_id)
    {
        $values = DB::select('SELECT to_json(data.percent) AS percent FROM sp_get_player_win_first_set_count(:player_id) data', array(":player_id" => $player_id));
        return self::damToDbo($values[0]);
    }


    public function jsonSerialize()
    {
        return array(
            "Percent" => $this->_percent
        );
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new SpGetPlayerWinFirstSetCount();
        if (isset($json["Percent"])) {
            $dbo->setPercent($json["Percent"]);
        }
        return $dbo;
    }

    public static function generateSample()
    {
        $dbo = new SpGetPlayerWinFirstSetCount();
        $dbo->setPercent(42.42);
        return $dbo;
    }


    /**
    * @var double
    */
    protected $_percent;
    public function getPercent()
    {
        return $this->_percent;
    }
    public function setPercent($value)
    {
        $this->_percent = $value;
    }
}
