<?php

include_once ("autoloader.php");

$cq = New ContentQueries("127.0.0.1","magasinet_freekick","root","mysql");

// save content if told to do so (by receiving correct AJAX data)
if (isset($_REQUEST["page_info"])) {
  //save page and echo ContentQueries response
  echo(json_encode($cq->storeNewPage($_REQUEST["page_info"])));
}

if (isset($_REQUEST["menu_data"])) {
  //save page and echo ContentQueries response
  echo(json_encode($cq->saveNewMenuName($_REQUEST["menu_data"])));
}

if (isset($_REQUEST["menu_link"])) {
  //save page and echo ContentQueries response
  echo(json_encode($cq->addMenuLink($_REQUEST["menu_link"])));
}