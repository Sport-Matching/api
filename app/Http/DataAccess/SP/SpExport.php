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

class SpExport extends LuSpDbo {

    /**
    * @param $dam
    * @return \App\Http\DataAccess\SP\SpExport|null
    */
    protected static function damToDbo($dam)
    {
        if (is_null($dam))
            return null;
        $dbo = new SpExport();

        $dbo->setJ1(LuStringUtils::convertJsonString($dam->j1));
        $dbo->setJ2(LuStringUtils::convertJsonString($dam->j2));
        $dbo->setJ1G1(LuStringUtils::convertJsonString($dam->j1_g1));
        $dbo->setJ1T1(LuStringUtils::convertJsonString($dam->j1_t1));
        $dbo->setJ1P1(LuStringUtils::convertJsonString($dam->j1_p1));
        $dbo->setJ2G1(LuStringUtils::convertJsonString($dam->j2_g1));
        $dbo->setJ2T1(LuStringUtils::convertJsonString($dam->j2_t1));
        $dbo->setJ2P1(LuStringUtils::convertJsonString($dam->j2_p1));
        $dbo->setJ1W3(LuStringUtils::convertJsonString($dam->j1_w3));
        $dbo->setJ1T3(LuStringUtils::convertJsonString($dam->j1_t3));
        $dbo->setJ1P3(LuStringUtils::convertJsonString($dam->j1_p3));
        $dbo->setJ2W3(LuStringUtils::convertJsonString($dam->j2_w3));
        $dbo->setJ2T3(LuStringUtils::convertJsonString($dam->j2_t3));
        $dbo->setJ2P3(LuStringUtils::convertJsonString($dam->j2_p3));
        $dbo->setJ1Age(LuStringUtils::convertJsonString($dam->j1_age));
        $dbo->setJ2Age(LuStringUtils::convertJsonString($dam->j2_age));
        $dbo->setJ1Rank(LuStringUtils::convertJsonString($dam->j1_rank));
        $dbo->setJ2Rank(LuStringUtils::convertJsonString($dam->j2_rank));
        $dbo->setGround(LuStringUtils::convertJsonString($dam->ground));
        $dbo->setResult(LuStringUtils::convertJsonString($dam->result));

        return $dbo;
    }


    /**
    * @param $in_date date
    * @return \App\Http\DataAccess\SP\SpExport[];
    */
    public static function execute($in_date)
    {
        $values = DB::select('SELECT to_json(data.j1) AS j1, to_json(data.j2) AS j2, to_json(data.j1_g1) AS j1_g1, to_json(data.j1_t1) AS j1_t1, to_json(data.j1_p1) AS j1_p1, to_json(data.j2_g1) AS j2_g1, to_json(data.j2_t1) AS j2_t1, to_json(data.j2_p1) AS j2_p1, to_json(data.j1_w3) AS j1_w3, to_json(data.j1_t3) AS j1_t3, to_json(data.j1_p3) AS j1_p3, to_json(data.j2_w3) AS j2_w3, to_json(data.j2_t3) AS j2_t3, to_json(data.j2_p3) AS j2_p3, to_json(data.j1_age) AS j1_age, to_json(data.j2_age) AS j2_age, to_json(data.j1_rank) AS j1_rank, to_json(data.j2_rank) AS j2_rank, to_json(data.ground) AS ground, to_json(data.result) AS result FROM sp_export(:in_date) data', array(":in_date" => $in_date));
        $dboValues = array();
        foreach ($values as $value)
            $dboValues[] = self::damToDbo($value);
        return $dboValues;
    }

    /**
    * @param $in_date date
    * @param $page int The page number, 0 based
    * @param $perPage int The number of items per page
    * @return \Luticate\Utils\LuMultipleDbo;
    */
    public static function getMultipleJson($in_date, $page, $perPage)
    {
        $values = DB::select('SELECT (SELECT count(*) FROM sp_export(:in_date)) as count, (SELECT json_agg(q) FROM (SELECT * FROM sp_export(:in_date) OFFSET (:page::int * :perPage::int) LIMIT :perPage) q) as data',
            array(":in_date" => $in_date, ":page" => $page, ":perPage" => $perPage));
        $value = $values[0];
        if (is_null($value->data))
        {
            $value->data = '[]';
        }
        $data = LuStringUtils::convertJsonString($value->data);
        return new LuMultipleDbo($value->count, $data);
    }

    public function jsonSerialize()
    {
        return array(
            "J1" => $this->_j1,
            "J2" => $this->_j2,
            "J1G1" => $this->_j1G1,
            "J1T1" => $this->_j1T1,
            "J1P1" => $this->_j1P1,
            "J2G1" => $this->_j2G1,
            "J2T1" => $this->_j2T1,
            "J2P1" => $this->_j2P1,
            "J1W3" => $this->_j1W3,
            "J1T3" => $this->_j1T3,
            "J1P3" => $this->_j1P3,
            "J2W3" => $this->_j2W3,
            "J2T3" => $this->_j2T3,
            "J2P3" => $this->_j2P3,
            "J1Age" => $this->_j1Age,
            "J2Age" => $this->_j2Age,
            "J1Rank" => $this->_j1Rank,
            "J2Rank" => $this->_j2Rank,
            "Ground" => $this->_ground,
            "Result" => $this->_result
        );
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new SpExport();
        if (isset($json["J1"])) {
            $dbo->setJ1($json["J1"]);
        }
        if (isset($json["J2"])) {
            $dbo->setJ2($json["J2"]);
        }
        if (isset($json["J1G1"])) {
            $dbo->setJ1G1($json["J1G1"]);
        }
        if (isset($json["J1T1"])) {
            $dbo->setJ1T1($json["J1T1"]);
        }
        if (isset($json["J1P1"])) {
            $dbo->setJ1P1($json["J1P1"]);
        }
        if (isset($json["J2G1"])) {
            $dbo->setJ2G1($json["J2G1"]);
        }
        if (isset($json["J2T1"])) {
            $dbo->setJ2T1($json["J2T1"]);
        }
        if (isset($json["J2P1"])) {
            $dbo->setJ2P1($json["J2P1"]);
        }
        if (isset($json["J1W3"])) {
            $dbo->setJ1W3($json["J1W3"]);
        }
        if (isset($json["J1T3"])) {
            $dbo->setJ1T3($json["J1T3"]);
        }
        if (isset($json["J1P3"])) {
            $dbo->setJ1P3($json["J1P3"]);
        }
        if (isset($json["J2W3"])) {
            $dbo->setJ2W3($json["J2W3"]);
        }
        if (isset($json["J2T3"])) {
            $dbo->setJ2T3($json["J2T3"]);
        }
        if (isset($json["J2P3"])) {
            $dbo->setJ2P3($json["J2P3"]);
        }
        if (isset($json["J1Age"])) {
            $dbo->setJ1Age($json["J1Age"]);
        }
        if (isset($json["J2Age"])) {
            $dbo->setJ2Age($json["J2Age"]);
        }
        if (isset($json["J1Rank"])) {
            $dbo->setJ1Rank($json["J1Rank"]);
        }
        if (isset($json["J2Rank"])) {
            $dbo->setJ2Rank($json["J2Rank"]);
        }
        if (isset($json["Ground"])) {
            $dbo->setGround($json["Ground"]);
        }
        if (isset($json["Result"])) {
            $dbo->setResult($json["Result"]);
        }
        return $dbo;
    }

    public static function generateSample()
    {
        $dbo = new SpExport();
        $dbo->setJ1("sample string");
        $dbo->setJ2("sample string");
        $dbo->setJ1G1(42);
        $dbo->setJ1T1(42);
        $dbo->setJ1P1(42);
        $dbo->setJ2G1(42);
        $dbo->setJ2T1(42);
        $dbo->setJ2P1(42);
        $dbo->setJ1W3(42);
        $dbo->setJ1T3(42);
        $dbo->setJ1P3(42);
        $dbo->setJ2W3(42);
        $dbo->setJ2T3(42);
        $dbo->setJ2P3(42);
        $dbo->setJ1Age(42);
        $dbo->setJ2Age(42);
        $dbo->setJ1Rank(42);
        $dbo->setJ2Rank(42);
        $dbo->setGround(42);
        $dbo->setResult(42);
        return $dbo;
    }


    /**
    * @var string
    */
    protected $_j1;
    public function getJ1()
    {
        return $this->_j1;
    }
    public function setJ1($value)
    {
        $this->_j1 = $value;
    }

    /**
    * @var string
    */
    protected $_j2;
    public function getJ2()
    {
        return $this->_j2;
    }
    public function setJ2($value)
    {
        $this->_j2 = $value;
    }

    /**
    * @var integer
    */
    protected $_j1G1;
    public function getJ1G1()
    {
        return $this->_j1G1;
    }
    public function setJ1G1($value)
    {
        $this->_j1G1 = $value;
    }

    /**
    * @var integer
    */
    protected $_j1T1;
    public function getJ1T1()
    {
        return $this->_j1T1;
    }
    public function setJ1T1($value)
    {
        $this->_j1T1 = $value;
    }

    /**
    * @var integer
    */
    protected $_j1P1;
    public function getJ1P1()
    {
        return $this->_j1P1;
    }
    public function setJ1P1($value)
    {
        $this->_j1P1 = $value;
    }

    /**
    * @var integer
    */
    protected $_j2G1;
    public function getJ2G1()
    {
        return $this->_j2G1;
    }
    public function setJ2G1($value)
    {
        $this->_j2G1 = $value;
    }

    /**
    * @var integer
    */
    protected $_j2T1;
    public function getJ2T1()
    {
        return $this->_j2T1;
    }
    public function setJ2T1($value)
    {
        $this->_j2T1 = $value;
    }

    /**
    * @var integer
    */
    protected $_j2P1;
    public function getJ2P1()
    {
        return $this->_j2P1;
    }
    public function setJ2P1($value)
    {
        $this->_j2P1 = $value;
    }

    /**
    * @var integer
    */
    protected $_j1W3;
    public function getJ1W3()
    {
        return $this->_j1W3;
    }
    public function setJ1W3($value)
    {
        $this->_j1W3 = $value;
    }

    /**
    * @var integer
    */
    protected $_j1T3;
    public function getJ1T3()
    {
        return $this->_j1T3;
    }
    public function setJ1T3($value)
    {
        $this->_j1T3 = $value;
    }

    /**
    * @var integer
    */
    protected $_j1P3;
    public function getJ1P3()
    {
        return $this->_j1P3;
    }
    public function setJ1P3($value)
    {
        $this->_j1P3 = $value;
    }

    /**
    * @var integer
    */
    protected $_j2W3;
    public function getJ2W3()
    {
        return $this->_j2W3;
    }
    public function setJ2W3($value)
    {
        $this->_j2W3 = $value;
    }

    /**
    * @var integer
    */
    protected $_j2T3;
    public function getJ2T3()
    {
        return $this->_j2T3;
    }
    public function setJ2T3($value)
    {
        $this->_j2T3 = $value;
    }

    /**
    * @var integer
    */
    protected $_j2P3;
    public function getJ2P3()
    {
        return $this->_j2P3;
    }
    public function setJ2P3($value)
    {
        $this->_j2P3 = $value;
    }

    /**
    * @var integer
    */
    protected $_j1Age;
    public function getJ1Age()
    {
        return $this->_j1Age;
    }
    public function setJ1Age($value)
    {
        $this->_j1Age = $value;
    }

    /**
    * @var integer
    */
    protected $_j2Age;
    public function getJ2Age()
    {
        return $this->_j2Age;
    }
    public function setJ2Age($value)
    {
        $this->_j2Age = $value;
    }

    /**
    * @var integer
    */
    protected $_j1Rank;
    public function getJ1Rank()
    {
        return $this->_j1Rank;
    }
    public function setJ1Rank($value)
    {
        $this->_j1Rank = $value;
    }

    /**
    * @var integer
    */
    protected $_j2Rank;
    public function getJ2Rank()
    {
        return $this->_j2Rank;
    }
    public function setJ2Rank($value)
    {
        $this->_j2Rank = $value;
    }

    /**
    * @var integer
    */
    protected $_ground;
    public function getGround()
    {
        return $this->_ground;
    }
    public function setGround($value)
    {
        $this->_ground = $value;
    }

    /**
    * @var integer
    */
    protected $_result;
    public function getResult()
    {
        return $this->_result;
    }
    public function setResult($value)
    {
        $this->_result = $value;
    }
}