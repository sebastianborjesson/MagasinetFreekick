<?php

include_once("autoloader.php");

$cq = New ContentQueries("127.0.0.1","magasinet_freekick","root","mysql");

if (isset($_REQUEST["search_param"])) {
	echo(json_encode($cq->searchForPages($_REQUEST["search_param"])));
} else {
	echo(json_encode($cg->getAllPages()));
}

