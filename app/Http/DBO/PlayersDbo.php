<?php

/**
 * AUTO GENERATED BY LUTICATE GENERATOR
 * ANY CHANGES WILL BE OVERWRITTEN
 */

namespace App\Http\DBO;

use Luticate\Utils\LuDbo;

class PlayersDbo extends LuDbo {

    public function jsonSerialize()
    {
        return array(
            "Id" => $this->_id,
            "Name" => $this->_name,
            "Birthdate" => $this->_birthdate,
            "Sex" => $this->_sex,
            "Country" => $this->_country,
            "Weight" => $this->_weight,
            "Size" => $this->_size,
            "PictureUrl" => $this->_pictureUrl
        );
    }

    public static function jsonDeserialize($json)
    {
        $dbo = new PlayersDbo();
        if (isset($json["Id"])) {
            $dbo->setId($json["Id"]);
        }
        if (isset($json["Name"])) {
            $dbo->setName($json["Name"]);
        }
        if (isset($json["Birthdate"])) {
            $dbo->setBirthdate($json["Birthdate"]);
        }
        if (isset($json["Sex"])) {
            $dbo->setSex($json["Sex"]);
        }
        if (isset($json["Country"])) {
            $dbo->setCountry($json["Country"]);
        }
        if (isset($json["Weight"])) {
            $dbo->setWeight($json["Weight"]);
        }
        if (isset($json["Size"])) {
            $dbo->setSize($json["Size"]);
        }
        if (isset($json["PictureUrl"])) {
            $dbo->setPictureUrl($json["PictureUrl"]);
        }
        return $dbo;
    }

    public static function generateSample()
    {
        $dbo = new PlayersDbo();
        $dbo->setId(42);
        $dbo->setName("sample string");
        $dbo->setBirthdate("sample string");
        $dbo->setSex(true);
        $dbo->setCountry("sample string");
        $dbo->setWeight(42);
        $dbo->setSize(42);
        $dbo->setPictureUrl("sample string");
        return $dbo;
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
     * @var string
     */
    protected $_name;
    public function getName()
    {
        return $this->_name;
    }
    public function setName($value)
    {
        $this->_name = $value;
    }

    /**
     * @var timestamp without time zone
     */
    protected $_birthdate;
    public function getBirthdate()
    {
        return $this->_birthdate;
    }
    public function setBirthdate($value)
    {
        $this->_birthdate = $value;
    }

    /**
     * @var boolean
     */
    protected $_sex;
    public function getSex()
    {
        return $this->_sex;
    }
    public function setSex($value)
    {
        $this->_sex = $value;
    }

    /**
     * @var string
     */
    protected $_country;
    public function getCountry()
    {
        return $this->_country;
    }
    public function setCountry($value)
    {
        $this->_country = $value;
    }

    /**
     * @var integer
     */
    protected $_weight;
    public function getWeight()
    {
        return $this->_weight;
    }
    public function setWeight($value)
    {
        $this->_weight = $value;
    }

    /**
     * @var integer
     */
    protected $_size;
    public function getSize()
    {
        return $this->_size;
    }
    public function setSize($value)
    {
        $this->_size = $value;
    }

    /**
     * @var string
     */
    protected $_pictureUrl;
    public function getPictureUrl()
    {
        return $this->_pictureUrl;
    }
    public function setPictureUrl($value)
    {
        $this->_pictureUrl = $value;
    }
}
