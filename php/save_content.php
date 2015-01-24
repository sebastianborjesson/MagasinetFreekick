<?php

include_once ("autoloader.php");

$cg = New ContentQueries("127.0.0.1","cms_example","root","mysql");

// save content if told to do so (by receiving correct AJAX data)
if (isset($_REQUEST["page_data"])) {
  //save page and echo ContentQueries response
  echo(json_encode($cq->storeNewPage($_REQUEST["page_data"])));
}