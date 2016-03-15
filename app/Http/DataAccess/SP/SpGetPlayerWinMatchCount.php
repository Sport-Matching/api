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

class SpGetPlayerWinMatchCount extends LuSpModel {

    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpGetPlayerWinMatchCount();

        $dbo->setCount($dam->count);

        return $dbo;
    }


    public static function execute($player_id)
    {
        $values = DB::select('SELECT * FROM sp_get_player_win_match_count(:player_id)', array(":player_id" => $player_id));
        return self::damToDbo($values[0]);
    }



    /**
    * @var integer
    */
    protected $_count;
    public function getCount()
    {
        return $this->_count;
    }
    public function setCount($value)
    {
        $this->_count = $value;
    }
}