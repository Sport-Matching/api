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

class SpGetMatchFull extends LuSpModel {

    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpGetMatchFull();

        $dbo->setMatch($dam->match);
        $dbo->setSets($dam->sets);

        return $dbo;
    }


    public static function execute($match_id)
    {
        $values = DB::select('SELECT * FROM sp_get_match_full(:match_id)', array(":match_id" => $match_id));
        return self::damToDbo($values[0]);
    }



    /**
    * @var USER-DEFINED
    */
    protected $_match;
    public function getMatch()
    {
        return $this->_match;
    }
    public function setMatch($value)
    {
        $this->_match = $value;
    }

    /**
    * @var ARRAY
    */
    protected $_sets;
    public function getSets()
    {
        return $this->_sets;
    }
    public function setSets($value)
    {
        $this->_sets = $value;
    }
}
