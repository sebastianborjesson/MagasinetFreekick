<?php

session_start();

//users
$users = array(
	"anna" => "1234",
	"pelle" => "4321",
	"bea" => "178@bea"
);

$outputHtml = "";

// Check if we have a logged in user 
if (isset($_SESSION["loggedInUser"])){

}
else {

	'<p><label for="username>User name:</label>'.
	'<input type="text" id="username" name="username"></p>'.
	'<p><label for="password>Password:</label>'.
	'<input type="password" id="password" name="password"></p>'.
	'</form>';
}

function CreateNewMainMenu (menuLinks) {

		var myMenuTree = buildMenuTreeStructure(menuLinks);

		var myMainMenuAsHtml = $("<ul class='nav navbar-nav'></ul>");

		myMainMenuAsHtml = buildNewMainMenu (myMainMenuAsHtml, menuTree);
	}