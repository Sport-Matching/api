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

class SpGetMatchesByPlayer extends LuSpModel {

    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpGetMatchesByPlayer();

        $dbo->setId($dam->id);
        $dbo->setPlayer1($dam->player1);
        $dbo->setPlayer2($dam->player2);
        $dbo->setDate($dam->date);
        $dbo->setSets($dam->sets);
        $dbo->setTournament($dam->tournament);

        return $dbo;
    }


    public static function execute($player_id)
    {
        $values = DB::select('SELECT * FROM sp_get_matches_by_player(:player_id)', array(":player_id" => $player_id));
        $dboValues = array();
        foreach ($values as $value)
            $dboValues[] = self::damToDbo($value);
        return $dboValues;
    }

    public static function getMultipleJson($player_id, $page, $perPage)
    {
        $values = DB::select('SELECT (SELECT count(*) FROM sp_get_matches_by_player(:player_id)) as count, (SELECT json_agg(q) FROM (SELECT * FROM sp_get_matches_by_player(:player_id) OFFSET (:page::int * :perPage::int) LIMIT :perPage) q) as data',
            array(":player_id" => $player_id, ":page" => $page, ":perPage" => $perPage));
        $value = $values[0];
        if (is_null($value->data))
        {
            $value->data = '[]';
        }
        $data = LuStringUtils::convertJsonString($value->data);
        return new LuMultipleDbo($value->count, $data);
    }


    /**
    * @var integer
    */
    protected $_id;
    public function getId()
    {
        return $this->_id;
    }
    public function setId($value)
    {
        $this->_id = $value;
    }

    /**
    * @var USER-DEFINED
    */
    protected $_player1;
    public function getPlayer1()
    {
        return $this->_player1;
    }
    public function setPlayer1($value)
    {
        $this->_player1 = $value;
    }

    /**
    * @var USER-DEFINED
    */
    protected $_player2;
    public function getPlayer2()
    {
        return $this->_player2;
    }
    public function setPlayer2($value)
    {
        $this->_player2 = $value;
    }

    /**
    * @var timestamp without time zone
    */
    protected $_date;
    public function getDate()
    {
        return $this->_date;
    }
    public function setDate($value)
    {
        $this->_date = $value;
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

    /**
    * @var USER-DEFINED
    */
    protected $_tournament;
    public function getTournament()
    {
        return $this->_tournament;
    }
    public function setTournament($value)
    {
        $this->_tournament = $value;
    }
}
