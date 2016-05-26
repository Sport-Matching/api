<?php
/**
 * Created by PhpStorm.
 * User: ZHAJOR
 * Date: 5/21/16
 * Time: 11:32 PM
 */

namespace App\Http\Controller;


use App\Http\Business\StatistiquesBusiness;
use Luticate\Utils\LuBusiness;
use Luticate\Utils\LuController;

class StatistiquesController extends LuController
{
    /**
     * @return LuBusiness
     */
    protected function getBusiness()
    {
        return new StatistiquesBusiness();
    }

    /**
     * Get all players basic information
     * @param int $page The page number, 0 based
     * @param int $perPage Items per page
     * @param string $query The filter query
     * @return null
     */
    public function prediction()
    {
        return StatistiquesBusiness::prediction();
    }

    public function getCsv()
    {
        return StatistiquesBusiness::getCsv();
    }
}