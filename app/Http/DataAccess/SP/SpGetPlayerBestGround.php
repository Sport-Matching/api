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

class SpGetPlayerBestGround extends LuSpDbo {

    /**
    * @param $dam
    * @return \App\Http\DataAccess\SP\SpGetPlayerBestGround|null
    */
    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpGetPlayerBestGround();

        $dbo->setGroundType(LuStringUtils::convertJsonString($dam->ground_type));

        return $dbo;
    }


    /**
    * @param $player_id integer
    * @return \App\Http\DataAccess\SP\SpGetPlayerBestGround;
    */
    public static function execute($player_id)
    {
        $values = DB::select('SELECT to_json(data.ground_type) AS ground_type FROM sp_get_player_best_ground(:player_id) data', array(":player_id" => $player_id));
        return self::damToDbo($values[0]);
    }


    public function jsonSerialize()
    {
        return array(
            "GroundType" => $this->_groundType
        );
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new SpGetPlayerBestGround();
        if (isset($json["GroundType"])) {
            $dbo->setGroundType($json["GroundType"]);
        }
        return $dbo;
    }

    public static function generateSample()
    {
        $dbo = new SpGetPlayerBestGround();
        $dbo->setGroundType(42);
        return $dbo;
    }


    /**
    * @var integer
    */
    protected $_groundType;
    public function getGroundType()
    {
        return $this->_groundType;
    }
    public function setGroundType($value)
    {
        $this->_groundType = $value;
    }
}
