<?php

use Luticate\Auth\Business\LuticateBusiness;
use Luticate\Doc\Business\LuDocBusiness;
use Luticate\Utils\LuRoute;

$route = LuRoute::getInstance();

$int = LuRoute::REG_INT;


LuDocBusiness::setupRoutes("/sport-matching");

//$route->get("/data", "Data", "getAll", ProjectPermissions::HOST_GET);
