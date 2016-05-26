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

class SpGetPlayerWinNumberThreeMonth extends LuSpDbo {

    /**
    * @param $dam
    * @return \App\Http\DataAccess\SP\SpGetPlayerWinNumberThreeMonth|null
    */
    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpGetPlayerWinNumberThreeMonth();

        $dbo->setSpGetPlayerWinNumberThreeMonth(LuStringUtils::convertJsonString($dam->sp_get_player_win_number_three_month));

        return $dbo;
    }


    /**
    * @param $in_id integer
    * @param $in_date timestamp without time zone
    * @return \App\Http\DataAccess\SP\SpGetPlayerWinNumberThreeMonth;
    */
    public static function execute($in_id, $in_date)
    {
        $values = DB::select('SELECT to_json(data.sp_get_player_win_number_three_month) AS sp_get_player_win_number_three_month FROM sp_get_player_win_number_three_month(:in_id, :in_date) data', array(":in_id" => $in_id, ":in_date" => $in_date));
        return self::damToDbo($values[0]);
    }


    public function jsonSerialize()
    {
        return array(
            "SpGetPlayerWinNumberThreeMonth" => $this->_spGetPlayerWinNumberThreeMonth
        );
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new SpGetPlayerWinNumberThreeMonth();
        if (isset($json["SpGetPlayerWinNumberThreeMonth"])) {
            $dbo->setSpGetPlayerWinNumberThreeMonth($json["SpGetPlayerWinNumberThreeMonth"]);
        }
        return $dbo;
    }

    public static function generateSample()
    {
        $dbo = new SpGetPlayerWinNumberThreeMonth();
        $dbo->setSpGetPlayerWinNumberThreeMonth(42);
        return $dbo;
    }


    /**
    * @var integer
    */
    protected $_spGetPlayerWinNumberThreeMonth;
    public function getSpGetPlayerWinNumberThreeMonth()
    {
        return $this->_spGetPlayerWinNumberThreeMonth;
    }
    public function setSpGetPlayerWinNumberThreeMonth($value)
    {
        $this->_spGetPlayerWinNumberThreeMonth = $value;
    }
}
