<?php

/**
 * AUTO GENERATED BY LUTICATE GENERATOR
 * ANY CHANGES WILL BE OVERWRITTEN
 */

namespace App\Http\DBO;

use Luticate\Utils\LuDbo;

class PronosticsDbo extends LuDbo {

    public function jsonSerialize()
    {
        return array(
            "MatchId" => $this->_matchId,
            "MatchWinnerNumber" => $this->_matchWinnerNumber,
            "Set1WinnerNumber" => $this->_set1WinnerNumber
        );
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new PronosticsDbo();
        if (isset($json["MatchId"])) {
            $dbo->setMatchId($json["MatchId"]);
        }
        if (isset($json["MatchWinnerNumber"])) {
            $dbo->setMatchWinnerNumber($json["MatchWinnerNumber"]);
        }
        if (isset($json["Set1WinnerNumber"])) {
            $dbo->setSet1WinnerNumber($json["Set1WinnerNumber"]);
        }
        return $dbo;
    }

    public static function generateSample()
    {
        $dbo = new PronosticsDbo();
        $dbo->setMatchId(42);
        $dbo->setMatchWinnerNumber(42);
        $dbo->setSet1WinnerNumber(42);
        return $dbo;
    }

    /**
     * @var integer
     */
    protected $_matchId;
    public function getMatchId()
    {
        return $this->_matchId;
    }
    public function setMatchId($value)
    {
        $this->_matchId = $value;
    }

    /**
     * @var integer
     */
    protected $_matchWinnerNumber;
    public function getMatchWinnerNumber()
    {
        return $this->_matchWinnerNumber;
    }
    public function setMatchWinnerNumber($value)
    {
        $this->_matchWinnerNumber = $value;
    }

    /**
     * @var integer
     */
    protected $_set1WinnerNumber;
    public function getSet1WinnerNumber()
    {
        return $this->_set1WinnerNumber;
    }
    public function setSet1WinnerNumber($value)
    {
        $this->_set1WinnerNumber = $value;
    }
}
