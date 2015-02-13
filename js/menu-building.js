
// skapa admin selecten för att välja meny i admin-formuläret
function createAdminSelect (data) {
	var menuTree = buildMenuTreeStructure(data);

	// skapa en select i vårt adminformulär
	var selectInHtml = $("<select class='form-control'></select>");

	// skapa ett listelement för menylänkarna
	var options = $("<option>Top</option>");

	// anta att alla länkar tillhör my-menu-machine-name, alltså samma meny
	options.data("menuData", {mlid: null, menu: "my-menu-machine-name"});
	selectInHtml.append(options);

	selectInHtml = buildOptions(selectInHtml, menuTree, 0);

	$(".pageForm .menuSelectMenu").html(selectInHtml);

}

// bygg dina val för meny du vill stoppa in ny sida i
function buildOptions (selectInHtml, menuItem, level) {
	// loopa igenom all menydata
	for (var i = 0; i < menuItem.length; i++) {
		var levelIndi = "-";
		// loopa en gång till för vilken nivå menyn ligger
		for (var j = 0; j < level; j++) {
			levelIndi += "-";
		}

		var menuOptions = $('<option value="'+menuItem[i].mlid+'">'+levelIndi+" "+menuItem[i].title+'</option>');

		// lägg till all meny data till varje option
		menuOptions.data("menuData", menuItem[j]);

		// appenda till option
		selectInHtml.append(menuOptions);

		if (menuItem[i].children.length > 0) {
			selectInHtml = buildOptions (selectInHtml, menuItem[i].children, level+1);
		}

	}
	return selectInHtml;
}


function buildMenuTreeStructure (menuLinksData) {
	var menuTree = [];
	var hashMap = {};

	// loopa igenom all menydata 
	menuLinksData.forEach(function(itemsInArray) {

		// alla länkar får en children attribut
		itemsInArray.children = [];


		hashMap["_"+itemsInArray.mlid] = itemsInArray;

		// lägger till de som är på toppnivå direkt i trädet
		if (!itemsInArray.plid) {
			menuTree.push(itemsInArray); // fäster som förälder i trädet
		}
	});

	for (var i in hashMap) {
		var aLink = hashMap[i];

		// nu lägger vi till länkar som undernivåer
		if (aLink.plid) {
			hashMap["_" + aLink.plid].children.push(aLink);
		}
	}

	
	console.log("menuTree: ", menuTree);
	return menuTree;
}

// skapa en meny som ligger i din navbar
function createMenu (data) {
	var menuTree = buildMenuTreeStructure(data);

	var myMenu = $("<ul class='nav navbar-nav'></ul>");

	buildMenu(myMenu, menuTree);

	$(".navbar-nav").not(".sign-in").remove();
	$("header .navbar-collapse").prepend(myMenu);

}

// printa ut meny på skärm
function buildMenu (menuToHtml, menuItem) {
	// loopa igenom dina menylänkar
	for (var i = 0; i < menuItem.length; i++) {
		var menuLinkObject;
		// om en meny länk inte har något barn, skapa en li tagg direkt
		if (menuItem[i].children.length < 1) {
			menuLinkObject = $('<li><a href="'+menuItem[i].path+'">'+menuItem[i].title+'</a></li>');
		}
		else {
			// om en meny länk har barn, skapa dropdown-menyer för varje nivå
			// skapa dropdown li taggen
			menuLinkObject = $('<li class="dropdown"><a href="'+menuItem[i].path+'">'+menuItem[i].title+'</a></li>');

			var subMenu = $('<ul class="dropdown-menu"></ul>');
			// rekusera funktionen för varje barn, beronde på hur många barn en förälder har
			buildMenu(subMenu, menuItem[i].children);

			menuLinkObject.prepend(subMenu);

			console.log(menuLinkObject);

		}
		menuToHtml.append(menuLinkObject);
	}
	return menuToHtml;
}

