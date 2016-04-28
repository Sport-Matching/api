<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/12/16
 * Time: 5:43 PM
 */

namespace App\Http\Business;

use App\Http\DataAccess\PlayersDataAccess;
use App\Http\DataAccess\TwitterDataAccess;

class Twitter
{
    public static function postMessage($message)
    {
        return TwitterDataAccess::postMessage($message);
    }

    public static function findMessages()
    {
        $bets = [];
        $messages = TwitterDataAccess::findMessages("#sportmatching");
        foreach ($messages["Statuses"] as $status) {
            $matches = [];
            if (preg_match('/\#sportmatching +(.+) +vs +(.*) +([0-9]+)\-([0-9]+)/i', $status["Text"], $matches)) {

                $player1 = PlayersBusiness::findOnePlayer($matches[1]);
                if (!is_null($player1)) {
                    $player2 = PlayersBusiness::findOnePlayer($matches[2]);
                    if (!is_null($player2)) {
                        $bets[] = [
                            "Player1" => [
                                "Player" =>$player1,
                                "Score" => $matches[3]
                            ],
                            "Player2" => [
                                "Player" =>$player2,
                                "Score" => $matches[4]
                            ]
                        ];
                    }
                }
            }
        }
        return $bets;
    }
}