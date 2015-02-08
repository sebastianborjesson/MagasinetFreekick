$(function() {

	function CreateNewMainMenu (menuLinks) {

		var myMenuTree = buildMenuTreeStructure(menuLinks);

		var myMainMenuAsHtml = $("<ul class='nav navbar-nav'></ul>");

		myMainMenuAsHtml = buildNewMainMenu (myMainMenuAsHtml, menuTree);
	}


	function buildMenuTreeStructure (menuLinks) {
		var hashMap = {};
		var menuTree = [];

		menuLinks.forEach(function(itemsInArray) {


			// alla länkar får en children attribut
			itemsInArray.children = [];

			// lägger till de som är på toppnivå direkt i trädet
			if (!itemsInArray.plid) {
				itemsInArray.push(itemsInArray); // pushar in föräldern in i trädet
			}

			hashMap["_"+itemsInArray.mlid] = itemsInArray;
		});

		for (var i in hashMap) {
			var aLink = hashMap[i];

			// nu lägger vi till länkar som undernivåer
			if (aLink.plid) {
				hashMap["_" + aLink.plid].children.push(aLink);
			}
		}
		console.log("menuTree: ", menuTree);
		console.log("hashMap: ", hashMap);

		return menuTree;
	}




});