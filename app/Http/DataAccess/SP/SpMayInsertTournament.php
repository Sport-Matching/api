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

class SpMayInsertTournament extends LuSpDbo {

    /**
    * @param $dam
    * @return \App\Http\DataAccess\SP\SpMayInsertTournament|null
    */
    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpMayInsertTournament();

        $dbo->setTournamentId(LuStringUtils::convertJsonString($dam->tournament_id));

        return $dbo;
    }


    /**
    * @param $tournament_name string
    * @param $tournament_ground integer
    * @param $tournament_year integer
    * @return \App\Http\DataAccess\SP\SpMayInsertTournament;
    */
    public static function execute($tournament_name, $tournament_ground, $tournament_year)
    {
        $values = DB::select('SELECT to_json(data.tournament_id) AS tournament_id FROM sp_may_insert_tournament(:tournament_name, :tournament_ground, :tournament_year) data', array(":tournament_name" => $tournament_name, ":tournament_ground" => $tournament_ground, ":tournament_year" => $tournament_year));
        return self::damToDbo($values[0]);
    }


    public function jsonSerialize()
    {
        return array(
            "TournamentId" => $this->_tournamentId
        );
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new SpMayInsertTournament();
        if (isset($json["TournamentId"])) {
            $dbo->setTournamentId($json["TournamentId"]);
        }
        return $dbo;
    }

    public static function generateSample()
    {
        $dbo = new SpMayInsertTournament();
        $dbo->setTournamentId(42);
        return $dbo;
    }


    /**
    * @var integer
    */
    protected $_tournamentId;
    public function getTournamentId()
    {
        return $this->_tournamentId;
    }
    public function setTournamentId($value)
    {
        $this->_tournamentId = $value;
    }
}
