<?php 

include_once ("autoloader.php");

$cq = New ContentQueries("127.0.0.1","magasinet_freekick","root","mysql");

if(isset($_REQUEST["get_menu_links"])) {
	echo(json_encode($cq->getMenuLinks($_REQUEST["get_menu_links"])));
}