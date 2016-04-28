<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/28/16
 * Time: 1:39 AM
 */

namespace App\Http\DataAccess;


use Luticate\Utils\LuStringUtils;
use TwitterAPIExchange;

class TwitterDataAccess
{
    const BASE_URL = 'https://api.twitter.com/1.1/';

    protected static function getSettings()
    {
        return array(
            'oauth_access_token' => getenv("TWITTER_OAUTH_ACCESS_TOKEN"),
            'oauth_access_token_secret' => getenv("TWITTER_OAUTH_ACCESS_TOKEN_SECRET"),
            'consumer_key' => getenv("TWITTER_CONSUMER_KEY"),
            'consumer_secret' => getenv("TWITTER_CONSUMER_SECRET")
        );
    }

    protected static function buildGet(array $get)
    {
        $q = "";
        foreach ($get as $key => $value) {
            $q .= ($q == "" ? "?" : "&") . urlencode($key) . "=" . urlencode($value);
        }
        return $q;
    }

    public static function post($url, $dataPost)
    {
        $twitter = new TwitterAPIExchange(self::getSettings());
        return LuStringUtils::convertJsonString($twitter->buildOauth(self::BASE_URL . $url, 'POST')
            ->setPostfields($dataPost)
            ->performRequest());
    }

    public static function get($url, $dataGet)
    {
        $twitter = new TwitterAPIExchange(self::getSettings());
        return LuStringUtils::convertJsonString($twitter->setGetfield(self::buildGet($dataGet))
            ->buildOauth(self::BASE_URL . $url, 'GET')
            ->performRequest());
    }

    public static function postMessage($message)
    {
        return TwitterDataAccess::post("statuses/update.json", array('status' => $message));
    }

    public static function findMessages($query)
    {
        return TwitterDataAccess::get("search/tweets.json", array("q" => $query));
    }
}