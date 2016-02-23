<?php

use Luticate\Auth\Business\LuticateBusiness;
use Luticate\Doc\Business\LuDocBusiness;
use Luticate\Utils\LuRoute;

$route = LuRoute::getInstance();

$int = LuRoute::REG_INT;

LuticateBusiness::setupAuth();
LuticateBusiness::setupRoutes();
LuDocBusiness::setupRoutes("/project");

//$route->get("/data", "Data", "getAll", ProjectPermissions::HOST_GET);
