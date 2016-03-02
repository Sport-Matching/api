<?php

use Luticate\Auth\Business\LuticateBusiness;
use Luticate\Doc\Business\LuDocBusiness;
use Luticate\Utils\LuRoute;

$route = LuRoute::getInstance();

$int = LuRoute::REG_INT;
$player_id = "{player_id:$int}";


LuDocBusiness::setupRoutes("/sport-matching");

$route->get("/players/$player_id/matches", "Players", "getMatches");
$route->get("/players/$player_id", "Players", "getById");
$route->get("/players/$player_id/ground", "Players", "getGround");
