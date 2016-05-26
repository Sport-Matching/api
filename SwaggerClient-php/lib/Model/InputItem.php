<?php
/**
 * InputItem
 *
 * PHP version 5
 *
 * @category Class
 * @package  Swagger\Client
 * @author   http://github.com/swagger-api/swagger-codegen
 * @license  http://www.apache.org/licenses/LICENSE-2.0 Apache Licene v2
 * @link     https://github.com/swagger-api/swagger-codegen
 */
/**
 *  Copyright 2016 SmartBear Software
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

namespace Swagger\Client\Model;

use \ArrayAccess;
/**
 * InputItem Class Doc Comment
 *
 * @category    Class
 * @description 
 * @package     Swagger\Client
 * @author      http://github.com/swagger-api/swagger-codegen
 * @license     http://www.apache.org/licenses/LICENSE-2.0 Apache Licene v2
 * @link        https://github.com/swagger-api/swagger-codegen
 */
class InputItem implements ArrayAccess
{
    /**
      * Array of property to type mappings. Used for (de)serialization 
      * @var string[]
      */
    static $swaggerTypes = array(
        'j1' => 'string',
        'j2' => 'string',
        'j1_g1' => 'int',
        'j1_t1' => 'int',
        'j1_p1' => 'int',
        'j2_g1' => 'int',
        'j2_t1' => 'int',
        'j2_p1' => 'int',
        'j1_w3' => 'int',
        'j1_t3' => 'int',
        'j1_p3' => 'int',
        'j2_w3' => 'int',
        'j2_t3' => 'int',
        'j2_p3' => 'int',
        'j1_age' => 'int',
        'j2_age' => 'int',
        'j1_rank' => 'int',
        'j2_rank' => 'int',
        'ground' => 'int',
        'column_19' => 'string',
        'column_20' => 'string',
        'column_21' => 'string',
        'column_22' => 'string',
        'column_23' => 'string'
    );
  
    static function swaggerTypes() {
        return self::$swaggerTypes;
    }

    /** 
      * Array of attributes where the key is the local name, and the value is the original name
      * @var string[] 
      */
    static $attributeMap = array(
        'j1' => 'j1',
        'j2' => 'j2',
        'j1_g1' => 'j1_g1',
        'j1_t1' => 'j1_t1',
        'j1_p1' => 'j1_p1',
        'j2_g1' => 'j2_g1',
        'j2_t1' => 'j2_t1',
        'j2_p1' => 'j2_p1',
        'j1_w3' => 'j1_w3',
        'j1_t3' => 'j1_t3',
        'j1_p3' => 'j1_p3',
        'j2_w3' => 'j2_w3',
        'j2_t3' => 'j2_t3',
        'j2_p3' => 'j2_p3',
        'j1_age' => 'j1_age',
        'j2_age' => 'j2_age',
        'j1_rank' => 'j1_rank',
        'j2_rank' => 'j2_rank',
        'ground' => 'ground',
        'column_19' => 'Column 19',
        'column_20' => 'Column 20',
        'column_21' => 'Column 21',
        'column_22' => 'Column 22',
        'column_23' => 'Column 23'
    );
  
    static function attributeMap() {
        return self::$attributeMap;
    }

    /**
      * Array of attributes to setter functions (for deserialization of responses)
      * @var string[]
      */
    static $setters = array(
        'j1' => 'setJ1',
        'j2' => 'setJ2',
        'j1_g1' => 'setJ1G1',
        'j1_t1' => 'setJ1T1',
        'j1_p1' => 'setJ1P1',
        'j2_g1' => 'setJ2G1',
        'j2_t1' => 'setJ2T1',
        'j2_p1' => 'setJ2P1',
        'j1_w3' => 'setJ1W3',
        'j1_t3' => 'setJ1T3',
        'j1_p3' => 'setJ1P3',
        'j2_w3' => 'setJ2W3',
        'j2_t3' => 'setJ2T3',
        'j2_p3' => 'setJ2P3',
        'j1_age' => 'setJ1Age',
        'j2_age' => 'setJ2Age',
        'j1_rank' => 'setJ1Rank',
        'j2_rank' => 'setJ2Rank',
        'ground' => 'setGround',
        'column_19' => 'setColumn19',
        'column_20' => 'setColumn20',
        'column_21' => 'setColumn21',
        'column_22' => 'setColumn22',
        'column_23' => 'setColumn23'
    );
  
    static function setters() {
        return self::$setters;
    }

    /**
      * Array of attributes to getter functions (for serialization of requests)
      * @var string[]
      */
    static $getters = array(
        'j1' => 'getJ1',
        'j2' => 'getJ2',
        'j1_g1' => 'getJ1G1',
        'j1_t1' => 'getJ1T1',
        'j1_p1' => 'getJ1P1',
        'j2_g1' => 'getJ2G1',
        'j2_t1' => 'getJ2T1',
        'j2_p1' => 'getJ2P1',
        'j1_w3' => 'getJ1W3',
        'j1_t3' => 'getJ1T3',
        'j1_p3' => 'getJ1P3',
        'j2_w3' => 'getJ2W3',
        'j2_t3' => 'getJ2T3',
        'j2_p3' => 'getJ2P3',
        'j1_age' => 'getJ1Age',
        'j2_age' => 'getJ2Age',
        'j1_rank' => 'getJ1Rank',
        'j2_rank' => 'getJ2Rank',
        'ground' => 'getGround',
        'column_19' => 'getColumn19',
        'column_20' => 'getColumn20',
        'column_21' => 'getColumn21',
        'column_22' => 'getColumn22',
        'column_23' => 'getColumn23'
    );
  
    static function getters() {
        return self::$getters;
    }

    
    /**
      * $j1 
      * @var string
      */
    protected $j1;
    
    /**
      * $j2 
      * @var string
      */
    protected $j2;
    
    /**
      * $j1_g1 
      * @var int
      */
    protected $j1_g1;
    
    /**
      * $j1_t1 
      * @var int
      */
    protected $j1_t1;
    
    /**
      * $j1_p1 
      * @var int
      */
    protected $j1_p1;
    
    /**
      * $j2_g1 
      * @var int
      */
    protected $j2_g1;
    
    /**
      * $j2_t1 
      * @var int
      */
    protected $j2_t1;
    
    /**
      * $j2_p1 
      * @var int
      */
    protected $j2_p1;
    
    /**
      * $j1_w3 
      * @var int
      */
    protected $j1_w3;
    
    /**
      * $j1_t3 
      * @var int
      */
    protected $j1_t3;
    
    /**
      * $j1_p3 
      * @var int
      */
    protected $j1_p3;
    
    /**
      * $j2_w3 
      * @var int
      */
    protected $j2_w3;
    
    /**
      * $j2_t3 
      * @var int
      */
    protected $j2_t3;
    
    /**
      * $j2_p3 
      * @var int
      */
    protected $j2_p3;
    
    /**
      * $j1_age 
      * @var int
      */
    protected $j1_age;
    
    /**
      * $j2_age 
      * @var int
      */
    protected $j2_age;
    
    /**
      * $j1_rank 
      * @var int
      */
    protected $j1_rank;
    
    /**
      * $j2_rank 
      * @var int
      */
    protected $j2_rank;
    
    /**
      * $ground 
      * @var int
      */
    protected $ground;
    
    /**
      * $column_19 
      * @var string
      */
    protected $column_19;
    
    /**
      * $column_20 
      * @var string
      */
    protected $column_20;
    
    /**
      * $column_21 
      * @var string
      */
    protected $column_21;
    
    /**
      * $column_22 
      * @var string
      */
    protected $column_22;
    
    /**
      * $column_23 
      * @var string
      */
    protected $column_23;
    

    /**
     * Constructor
     * @param mixed[] $data Associated array of property value initalizing the model
     */
    public function __construct(array $data = null)
    {
        
        if ($data != null) {
            $this->j1 = $data["j1"];
            $this->j2 = $data["j2"];
            $this->j1_g1 = $data["j1_g1"];
            $this->j1_t1 = $data["j1_t1"];
            $this->j1_p1 = $data["j1_p1"];
            $this->j2_g1 = $data["j2_g1"];
            $this->j2_t1 = $data["j2_t1"];
            $this->j2_p1 = $data["j2_p1"];
            $this->j1_w3 = $data["j1_w3"];
            $this->j1_t3 = $data["j1_t3"];
            $this->j1_p3 = $data["j1_p3"];
            $this->j2_w3 = $data["j2_w3"];
            $this->j2_t3 = $data["j2_t3"];
            $this->j2_p3 = $data["j2_p3"];
            $this->j1_age = $data["j1_age"];
            $this->j2_age = $data["j2_age"];
            $this->j1_rank = $data["j1_rank"];
            $this->j2_rank = $data["j2_rank"];
            $this->ground = $data["ground"];
            $this->column_19 = $data["column_19"];
            $this->column_20 = $data["column_20"];
            $this->column_21 = $data["column_21"];
            $this->column_22 = $data["column_22"];
            $this->column_23 = $data["column_23"];
        }
    }
    
    /**
     * Gets j1
     * @return string
     */
    public function getJ1()
    {
        return $this->j1;
    }
  
    /**
     * Sets j1
     * @param string $j1 
     * @return $this
     */
    public function setJ1($j1)
    {
        
        $this->j1 = $j1;
        return $this;
    }
    
    /**
     * Gets j2
     * @return string
     */
    public function getJ2()
    {
        return $this->j2;
    }
  
    /**
     * Sets j2
     * @param string $j2 
     * @return $this
     */
    public function setJ2($j2)
    {
        
        $this->j2 = $j2;
        return $this;
    }
    
    /**
     * Gets j1_g1
     * @return int
     */
    public function getJ1G1()
    {
        return $this->j1_g1;
    }
  
    /**
     * Sets j1_g1
     * @param int $j1_g1 
     * @return $this
     */
    public function setJ1G1($j1_g1)
    {
        
        $this->j1_g1 = $j1_g1;
        return $this;
    }
    
    /**
     * Gets j1_t1
     * @return int
     */
    public function getJ1T1()
    {
        return $this->j1_t1;
    }
  
    /**
     * Sets j1_t1
     * @param int $j1_t1 
     * @return $this
     */
    public function setJ1T1($j1_t1)
    {
        
        $this->j1_t1 = $j1_t1;
        return $this;
    }
    
    /**
     * Gets j1_p1
     * @return int
     */
    public function getJ1P1()
    {
        return $this->j1_p1;
    }
  
    /**
     * Sets j1_p1
     * @param int $j1_p1 
     * @return $this
     */
    public function setJ1P1($j1_p1)
    {
        
        $this->j1_p1 = $j1_p1;
        return $this;
    }
    
    /**
     * Gets j2_g1
     * @return int
     */
    public function getJ2G1()
    {
        return $this->j2_g1;
    }
  
    /**
     * Sets j2_g1
     * @param int $j2_g1 
     * @return $this
     */
    public function setJ2G1($j2_g1)
    {
        
        $this->j2_g1 = $j2_g1;
        return $this;
    }
    
    /**
     * Gets j2_t1
     * @return int
     */
    public function getJ2T1()
    {
        return $this->j2_t1;
    }
  
    /**
     * Sets j2_t1
     * @param int $j2_t1 
     * @return $this
     */
    public function setJ2T1($j2_t1)
    {
        
        $this->j2_t1 = $j2_t1;
        return $this;
    }
    
    /**
     * Gets j2_p1
     * @return int
     */
    public function getJ2P1()
    {
        return $this->j2_p1;
    }
  
    /**
     * Sets j2_p1
     * @param int $j2_p1 
     * @return $this
     */
    public function setJ2P1($j2_p1)
    {
        
        $this->j2_p1 = $j2_p1;
        return $this;
    }
    
    /**
     * Gets j1_w3
     * @return int
     */
    public function getJ1W3()
    {
        return $this->j1_w3;
    }
  
    /**
     * Sets j1_w3
     * @param int $j1_w3 
     * @return $this
     */
    public function setJ1W3($j1_w3)
    {
        
        $this->j1_w3 = $j1_w3;
        return $this;
    }
    
    /**
     * Gets j1_t3
     * @return int
     */
    public function getJ1T3()
    {
        return $this->j1_t3;
    }
  
    /**
     * Sets j1_t3
     * @param int $j1_t3 
     * @return $this
     */
    public function setJ1T3($j1_t3)
    {
        
        $this->j1_t3 = $j1_t3;
        return $this;
    }
    
    /**
     * Gets j1_p3
     * @return int
     */
    public function getJ1P3()
    {
        return $this->j1_p3;
    }
  
    /**
     * Sets j1_p3
     * @param int $j1_p3 
     * @return $this
     */
    public function setJ1P3($j1_p3)
    {
        
        $this->j1_p3 = $j1_p3;
        return $this;
    }
    
    /**
     * Gets j2_w3
     * @return int
     */
    public function getJ2W3()
    {
        return $this->j2_w3;
    }
  
    /**
     * Sets j2_w3
     * @param int $j2_w3 
     * @return $this
     */
    public function setJ2W3($j2_w3)
    {
        
        $this->j2_w3 = $j2_w3;
        return $this;
    }
    
    /**
     * Gets j2_t3
     * @return int
     */
    public function getJ2T3()
    {
        return $this->j2_t3;
    }
  
    /**
     * Sets j2_t3
     * @param int $j2_t3 
     * @return $this
     */
    public function setJ2T3($j2_t3)
    {
        
        $this->j2_t3 = $j2_t3;
        return $this;
    }
    
    /**
     * Gets j2_p3
     * @return int
     */
    public function getJ2P3()
    {
        return $this->j2_p3;
    }
  
    /**
     * Sets j2_p3
     * @param int $j2_p3 
     * @return $this
     */
    public function setJ2P3($j2_p3)
    {
        
        $this->j2_p3 = $j2_p3;
        return $this;
    }
    
    /**
     * Gets j1_age
     * @return int
     */
    public function getJ1Age()
    {
        return $this->j1_age;
    }
  
    /**
     * Sets j1_age
     * @param int $j1_age 
     * @return $this
     */
    public function setJ1Age($j1_age)
    {
        
        $this->j1_age = $j1_age;
        return $this;
    }
    
    /**
     * Gets j2_age
     * @return int
     */
    public function getJ2Age()
    {
        return $this->j2_age;
    }
  
    /**
     * Sets j2_age
     * @param int $j2_age 
     * @return $this
     */
    public function setJ2Age($j2_age)
    {
        
        $this->j2_age = $j2_age;
        return $this;
    }
    
    /**
     * Gets j1_rank
     * @return int
     */
    public function getJ1Rank()
    {
        return $this->j1_rank;
    }
  
    /**
     * Sets j1_rank
     * @param int $j1_rank 
     * @return $this
     */
    public function setJ1Rank($j1_rank)
    {
        
        $this->j1_rank = $j1_rank;
        return $this;
    }
    
    /**
     * Gets j2_rank
     * @return int
     */
    public function getJ2Rank()
    {
        return $this->j2_rank;
    }
  
    /**
     * Sets j2_rank
     * @param int $j2_rank 
     * @return $this
     */
    public function setJ2Rank($j2_rank)
    {
        
        $this->j2_rank = $j2_rank;
        return $this;
    }
    
    /**
     * Gets ground
     * @return int
     */
    public function getGround()
    {
        return $this->ground;
    }
  
    /**
     * Sets ground
     * @param int $ground 
     * @return $this
     */
    public function setGround($ground)
    {
        
        $this->ground = $ground;
        return $this;
    }
    
    /**
     * Gets column_19
     * @return string
     */
    public function getColumn19()
    {
        return $this->column_19;
    }
  
    /**
     * Sets column_19
     * @param string $column_19 
     * @return $this
     */
    public function setColumn19($column_19)
    {
        
        $this->column_19 = $column_19;
        return $this;
    }
    
    /**
     * Gets column_20
     * @return string
     */
    public function getColumn20()
    {
        return $this->column_20;
    }
  
    /**
     * Sets column_20
     * @param string $column_20 
     * @return $this
     */
    public function setColumn20($column_20)
    {
        
        $this->column_20 = $column_20;
        return $this;
    }
    
    /**
     * Gets column_21
     * @return string
     */
    public function getColumn21()
    {
        return $this->column_21;
    }
  
    /**
     * Sets column_21
     * @param string $column_21 
     * @return $this
     */
    public function setColumn21($column_21)
    {
        
        $this->column_21 = $column_21;
        return $this;
    }
    
    /**
     * Gets column_22
     * @return string
     */
    public function getColumn22()
    {
        return $this->column_22;
    }
  
    /**
     * Sets column_22
     * @param string $column_22 
     * @return $this
     */
    public function setColumn22($column_22)
    {
        
        $this->column_22 = $column_22;
        return $this;
    }
    
    /**
     * Gets column_23
     * @return string
     */
    public function getColumn23()
    {
        return $this->column_23;
    }
  
    /**
     * Sets column_23
     * @param string $column_23 
     * @return $this
     */
    public function setColumn23($column_23)
    {
        
        $this->column_23 = $column_23;
        return $this;
    }
    
    /**
     * Returns true if offset exists. False otherwise.
     * @param  integer $offset Offset 
     * @return boolean
     */
    public function offsetExists($offset)
    {
        return isset($this->$offset);
    }
  
    /**
     * Gets offset.
     * @param  integer $offset Offset 
     * @return mixed 
     */
    public function offsetGet($offset)
    {
        return $this->$offset;
    }
  
    /**
     * Sets value based on offset.
     * @param  integer $offset Offset 
     * @param  mixed   $value  Value to be set
     * @return void
     */
    public function offsetSet($offset, $value)
    {
        $this->$offset = $value;
    }
  
    /**
     * Unsets offset.
     * @param  integer $offset Offset 
     * @return void
     */
    public function offsetUnset($offset)
    {
        unset($this->$offset);
    }
  
    /**
     * Gets the string presentation of the object
     * @return string
     */
    public function __toString()
    {
        if (defined('JSON_PRETTY_PRINT')) {
            return json_encode(\Swagger\Client\ObjectSerializer::sanitizeForSerialization($this), JSON_PRETTY_PRINT);
        } else {
            return json_encode(\Swagger\Client\ObjectSerializer::sanitizeForSerialization($this));
        }
    }
}
