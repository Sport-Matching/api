<?php

/**
 * AUTO GENERATED BY LUTICATE GENERATOR
 * ANY CHANGES WILL BE OVERWRITTEN
 */

namespace App\Http\DataAccess\SP;

use Luticate\Utils\LuSpModel;
use Luticate\Utils\LuMultipleDbo;
use Luticate\Utils\LuStringUtils;
use Illuminate\Support\Facades\DB;

class SpMayInsertPlayer extends LuSpModel {

    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpMayInsertPlayer();

        $dbo->setPlayerId($dam->player_id);

        return $dbo;
    }


    public static function execute($player_name, $player_birthdate, $player_sex, $player_country, $player_weight, $player_size, $player_picture_url)
    {
        $values = DB::select('SELECT * FROM sp_may_insert_player(:player_name, :player_birthdate, :player_sex, :player_country, :player_weight, :player_size, :player_picture_url)', array(":player_name" => $player_name, ":player_birthdate" => $player_birthdate, ":player_sex" => $player_sex, ":player_country" => $player_country, ":player_weight" => $player_weight, ":player_size" => $player_size, ":player_picture_url" => $player_picture_url));
        return self::damToDbo($values[0]);
    }



    /**
    * @var integer
    */
    protected $_playerId;
    public function getPlayerId()
    {
        return $this->_playerId;
    }
    public function setPlayerId($value)
    {
        $this->_playerId = $value;
    }
}
