<?php
/**
 * Created by PhpStorm.
 * User: ZHAJOR
 * Date: 5/21/16
 * Time: 11:34 PM
 */

namespace App\Http\Business;


use App\Http\DataAccess\StatistiquesDataAccess;
use Luticate\Utils\LuBusiness;
use Swagger\Client\Api\DefaultApi;
use Swagger\Client\Configuration;
use Swagger\Client\Model\ExecutionOutputs;
use Swagger\Client\Model\Output1Item;


class StatistiquesBusiness extends LuBusiness
{
    protected static function getDataAccess()
    {
        return new StatistiquesDataAccess();
    }

    
    public static function prediction()
    {
        $j1 = self::getParam('j1', null);
        $j2 = self::getParam('j2', null);
        $date = self::getParam('date', null);
        $datas = StatistiquesDataAccess::prediction($j1, $j2, $date);
        $datas = $datas->getData();
        $body = '{
  "Inputs": {
    "input": {
      "ColumnNames": [
        "j1",
        "j2",
        "j1_g1",
        "j1_t1",
        "j1_p1",
        "j2_g1",
        "j2_t1",
        "j2_p1",
        "j1_w3",
        "j1_t3",
        "j1_p3",
        "j2_w3",
        "j2_t3",
        "j2_p3",
        "j1_age",
        "j2_age",
        "j1_rank",
        "j2_rank",
        "ground",
        "Column 19",
        "Column 20",
        "Column 21",
        "Column 22",
        "Column 23"
      ],
      "Values": [
        [
          "'.$datas[0]['Name'].'",
          "'.$datas[1]['Name'].'",
          "'.$datas[0]['W1'].'",
          "'.$datas[0]['T1'].'",
          "'.$datas[0]['P1'].'",
          "'.$datas[1]['W1'].'",
          "'.$datas[1]['T1'].'",
          "'.$datas[1]['P1'].'",
          "'.$datas[0]['W3'].'",
          "'.$datas[0]['T3'].'",
          "'.$datas[0]['P3'].'",
          "'.$datas[1]['W3'].'",
          "'.$datas[1]['T3'].'",
          "'.$datas[1]['P3'].'",
          "'.$datas[0]['Age'].'",
          "'.$datas[1]['Age'].'",
          "'.$datas[0]['Rank'].'",
          "'.$datas[1]['Rank'].'",
          "1",
          "value",
          "value",
          "value",
          "value",
          "value"
        ]
      ]
    }
  },
  "GlobalParameters": {
    "Append score columns to output": ""
  }
}';
        //var_dump($body);
        $API_KEY = 'Bearer x3V91rZqAxK+HebcGrK1LM9wg3cC+Awu13YWwUUWZeULcbAoWAeVtVRWW0+aUdQh8oehhui/SBDx7qftnP3vxQ==';
        Configuration::getDefaultConfiguration()->addDefaultHeader('Authorization', $API_KEY);
        Configuration::getDefaultConfiguration()->setDebug(false);
        $api = new DefaultApi();
        try {
           $answer = $api->execute($body);
            $obj = $answer->Results->output1->value->Values[0];
            return array('j1'=> $obj[0], 'j2' => $obj[1], 'prediction' => $obj[24]);
        }
        catch(\Exception $e){
            echo $e->getMessage();
        }



    }

    public static function getCsv() {
        $j1 = self::getParam('j1', null);
        $j2 = self::getParam('j2', null);
        $date = self::getParam('date', null);
        $datas = StatistiquesDataAccess::prediction($j1, $j2, $date);
        $datas = $datas->getData();
        $j11 = $datas[0]['W1'].",".$datas[0]['T1'].",".$datas[0]['P1'];
        $j21 = $datas[1]['W1'].",".$datas[1]['T1'].",".$datas[1]['P1'];
        $j13 = $datas[0]['W3'].",".$datas[0]['T3'].",".$datas[0]['P3'];
        $j23 = $datas[1]['W3'].",".$datas[1]['T3'].",".$datas[1]['P3'];
        $csv= $datas[0]['Name'].",".$j11.",".$j21.",".$j13.",".$j23.",".$datas[0]['Age'].",".$datas[1]['Age'].",".$datas[0]['Rank'].",".$datas[1]['Rank'].",1\n"
        .$datas[1]['Name'].",".$j21.",".$j11.",".$j23.",".$j13.",".$datas[1]['Age'].",".$datas[0]['Age'].",".$datas[1]['Rank'].",".$datas[0]['Rank'].",1";
        return $csv;
    }

}
