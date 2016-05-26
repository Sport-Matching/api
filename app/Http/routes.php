<?php

use Luticate\Doc\Business\LuDocBusiness;
use Luticate\Utils\LuRoute;

$route = LuRoute::getInstance();

$int = LuRoute::REG_INT;
$player_id = "{player_id:$int}";
$player1_id = "{player1_id:$int}";
$player2_id = "{player2_id:$int}";


LuDocBusiness::setupRoutes("/sport-matching");

$route->get("/players", "Players", "getAll");
$route->get("/players/$player_id/matches", "Players", "getMatches");
$route->get("/players/$player_id", "Players", "getFullById");

$route->get("/matches/$player1_id/vs/$player2_id", "Matches", "getVs");
$route->get("/matches/vs", "Matches", "getVsWithName");

//$route->get("/stats", "Statistiques", "get");
$route->post("/prediction", "Statistiques", "prediction");
$route->post("/getCsv", "Statistiques", "getCsv");