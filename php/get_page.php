<?php

include_once("autoloader.php");

$cq = New ContentQueries("127.0.0.1","magasinet_freekick","root","mysql");

if(isset($_REQUEST["get_page"])) {
  // var_dump($_REQUEST["get_page"]);
  // die();
  echo(json_encode($cq->getPages($_REQUEST["get_page"])));
}