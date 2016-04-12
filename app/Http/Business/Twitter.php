<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/12/16
 * Time: 5:43 PM
 */

namespace App\Http\Business;

use TwitterAPIExchange;

class Twitter
{
    public static function post($message)
    {
        $settings = array(
            'oauth_access_token' => getenv("TWITTER_OAUTH_ACCESS_TOKEN"),
            'oauth_access_token_secret' => getenv("TWITTER_OAUTH_ACCESS_TOKEN_SECRET"),
            'consumer_key' => getenv("TWITTER_CONSUMER_KEY"),
            'consumer_secret' => getenv("TWITTER_CONSUMER_SECRET")
        );
        $url = 'https://api.twitter.com/1.1/statuses/update.json';
        $requestMethod = 'POST';
        $postfields = array(
            'status' => $message
        );
        $twitter = new TwitterAPIExchange($settings);
        return $twitter->buildOauth($url, $requestMethod)
            ->setPostfields($postfields)
            ->performRequest();
    }
}