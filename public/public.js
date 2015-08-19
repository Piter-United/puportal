/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var app,
	  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

	__webpack_require__(1);

	__webpack_require__(2);

	__webpack_require__(3);

	__webpack_require__(4);

	__webpack_require__(5);

	__webpack_require__(6);

	__webpack_require__(7);

	__webpack_require__(8);

	__webpack_require__(9);

	__webpack_require__(10);

	__webpack_require__(11);

	app = angular.module('app', ['ngCookies', 'ngRoute', 'ngAnimate', 'ngFileUpload']);

	__webpack_require__(15);

	__webpack_require__(16);

	__webpack_require__(17);

	app.config(function($routeProvider) {
	  var rp;
	  rp = $routeProvider;
	  rp.when('/', {
	    name: 'index',
	    templateUrl: 'index.jade',
	    controller: 'IndexCtrl'
	  });
	  rp.when('/profile', {
	    name: 'profile',
	    templateUrl: 'profile.jade',
	    controller: 'ProfileCtrl'
	  });
	  rp.when('/events', {
	    name: 'events',
	    templateUrl: 'events.jade',
	    controller: 'EventsCtrl'
	  });
	  rp.when('/events/new', {
	    name: 'events',
	    templateUrl: 'new_event.jade',
	    controller: 'NewEventCtrl'
	  });
	  rp.when('/communities', {
	    name: 'communities',
	    templateUrl: 'communities.jade',
	    controller: 'CommunitiesCtrl'
	  });
	  rp.when('/communities/new', {
	    name: 'community',
	    templateUrl: 'new_community.jade',
	    controller: 'NewCommunityCtrl'
	  });
	  rp.when('/communities/:id', {
	    name: 'community',
	    templateUrl: 'community.jade',
	    controller: 'CommunityCtrl'
	  });
	  return rp.when('/events/:id', {
	    name: 'event',
	    templateUrl: 'event.jade',
	    controller: 'EventCtrl'
	  });
	});

	app.run(function($rootScope, $window, Menu, Data) {
	  Menu.init();
	  return Data.profile().then(function(profile) {
	    return $rootScope.currentUser = profile;
	  });
	});

	app.filter("rawHtml", [
	  "$sce", function($sce) {
	    return function(val) {
	      return $sce.trustAsHtml(val);
	    };
	  }
	]);

	app.filter("moment", function() {
	  return function(value) {
	    var date, now;
	    now = moment();
	    date = moment(value);
	    return now.to(date).toString();
	  };
	});

	app.controller('IndexCtrl', function($scope, $location, Data, Menu) {
	  Data.events.all({
	    forthcoming: true
	  }).then(function(events) {
	    return $scope.events = events;
	  });
	  return Data.communities.all({
	    fresh: true
	  }).then(function(communities) {
	    return $scope.communities = communities;
	  });
	});

	app.controller('ProfileCtrl', function($scope, $location, Data, Menu) {
	  Menu.init();
	  return Data.profile().then(function(profile) {
	    return $scope.profile = profile;
	  });
	});

	app.controller('EventsCtrl', function($scope, $location, Data, Menu) {
	  $scope.fetch = function() {
	    return Data.events.all({
	      day: $scope.selected.toJSON()
	    }).then(function(events) {
	      return $scope.events = events;
	    });
	  };
	  $scope.select = function(day) {
	    $scope.selected = day.date;
	    return $scope.fetch();
	  };
	  $scope.day = moment();
	  $scope.selected = $scope.day;
	  return $scope.fetch();
	});

	app.controller('EventCtrl', function($scope, $location, Data, Menu, $routeParams) {
	  return Data.events.find($routeParams.id).then(function(event) {
	    return $scope.event = event;
	  });
	});

	app.controller('NewEventCtrl', function($scope, $location, Data) {
	  $scope.event = {};
	  $scope.errors = {};
	  $scope.options = [];
	  $scope.hasError = function(name) {
	    return !!$scope.errors[name];
	  };
	  $scope.save = function() {
	    var event;
	    event = $scope.event;
	    return Data.events.create(event).then(function(result) {
	      if (result.data && result.data.errors) {
	        return $scope.errors = result.data.errors;
	      } else {
	        return $location.path("/events");
	      }
	    });
	  };
	  $scope.tagsConfig = function() {
	    return {
	      delimiter: ",",
	      persist: false,
	      create: function(input) {
	        return {
	          value: input,
	          text: input
	        };
	      }
	    };
	  };
	  $scope.descriptionConfig = function() {
	    return {
	      textarea: null,
	      basePath: "https://cdnjs.cloudflare.com/ajax/libs/epiceditor/0.2.2",
	      clientSideStorage: false,
	      localStorageName: "epiceditor",
	      useNativeFullscreen: true,
	      parser: marked,
	      theme: {
	        base: "/themes/base/epiceditor.css",
	        editor: "/themes/editor/epic-light.css"
	      },
	      button: {
	        preview: true,
	        fullscreen: true,
	        bar: "auto"
	      },
	      focusOnLoad: false,
	      string: {
	        togglePreview: "Toggle Preview Mode",
	        toggleEdit: "Toggle Edit Mode",
	        toggleFullscreen: "Enter Fullscreen"
	      },
	      autogrow: false
	    };
	  };
	  return $scope.communityConfig = function() {
	    return {
	      valueField: 'id',
	      labelField: 'id',
	      searchField: 'name',
	      options: [],
	      create: false,
	      load: function(query, callback) {
	        if (!query.length) {
	          callback();
	        }
	        return Data.communities.all().then(function(communities) {
	          return callback(communities);
	        });
	      },
	      render: {
	        item: function(item, escape) {
	          return "<div>" + (escape(item.name)) + "</div>";
	        },
	        option: function(item, escape) {
	          return "<div>" + (escape(item.name)) + "</div>";
	        }
	      }
	    };
	  };
	});

	app.controller('CommunitiesCtrl', function($scope, $location, Data, Menu, $routeParams) {
	  return Data.communities.all().then(function(communities) {
	    return $scope.communities = communities;
	  });
	});

	app.controller('CommunityCtrl', function($scope, $location, Data, Menu, $routeParams) {
	  $scope.uids = [];
	  $scope.isMember = function() {
	    var ref;
	    console.log($scope.uids, $scope.$root.currentUser);
	    return $scope.$root.currentUser && (ref = $scope.$root.currentUser.id, indexOf.call($scope.uids, ref) >= 0);
	  };
	  $scope.isNotMember = function() {
	    return !$scope.isMember();
	  };
	  $scope.join = function() {
	    return Data.communities.join($routeParams.id).then(function(result) {
	      return $scope.fetch();
	    });
	  };
	  $scope.leave = function() {
	    return Data.communities.leave($routeParams.id).then(function(result) {
	      return $scope.fetch();
	    });
	  };
	  $scope.fetch = function() {
	    Data.communities.find($routeParams.id).then(function(community) {
	      $scope.community = community;
	      return $scope.uids = $.map(community.users, function(user) {
	        return user.id;
	      });
	    });
	    return Data.events.all({
	      "communities[]": [$routeParams.id]
	    }).then(function(events) {
	      return $scope.events = events;
	    });
	  };
	  return $scope.fetch();
	});

	app.controller('NewCommunityCtrl', function($scope, $location, Data) {
	  $scope.errors = {};
	  $scope.community = {};
	  $scope.hasError = function(name) {
	    return !!$scope.errors[name];
	  };
	  $scope.tagsConfig = function() {
	    return {
	      delimiter: ",",
	      persist: false,
	      create: function(input) {
	        return {
	          value: input,
	          text: input
	        };
	      }
	    };
	  };
	  $scope.descriptionConfig = function() {
	    return {
	      textarea: null,
	      basePath: "https://cdnjs.cloudflare.com/ajax/libs/epiceditor/0.2.2",
	      clientSideStorage: false,
	      localStorageName: "epiceditor",
	      useNativeFullscreen: true,
	      parser: marked,
	      theme: {
	        base: "/themes/base/epiceditor.css",
	        preview: "/themes/preview/preview-light.css",
	        editor: "/themes/editor/epic-light.css"
	      },
	      button: {
	        preview: true,
	        fullscreen: true,
	        bar: "auto"
	      },
	      focusOnLoad: false,
	      string: {
	        togglePreview: "Toggle Preview Mode",
	        toggleEdit: "Toggle Edit Mode",
	        toggleFullscreen: "Enter Fullscreen"
	      },
	      autogrow: false
	    };
	  };
	  return $scope.save = function() {
	    console.log($scope.community);
	    return Data.communities.create($scope.community, $scope.logo).progress(function(evt) {
	      var progressPercentage;
	      progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
	      return console.log("progress: " + progressPercentage + "% ", evt.config.file);
	    }).success(function(data, status, headers, config) {
	      console.log("file " + config.file + "uploaded. Response: ", data);
	      return $location.path("/communities");
	    }).error(function(data, status, headers, config) {
	      console.log("error status: " + status, data);
	      if (data.errors) {
	        return $scope.errors = data.errors;
	      }
	    });
	  };
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	module.exports = "module.exports = __webpack_public_path__ + \"/index.html\"";

/***/ },
/* 2 */
/***/ function(module, exports) {

	var v1="<div class=\"jumbotron cover\"><div class=\"container\"><a href=\"/users/sign_in\" role=\"button\" class=\"btn btn-primary btn-lg pull-right\">Присоединииться</a><h1>Piter United</h1><p>Объединение IT-сообществ Санкт-Петербурга</p></div></div><div class=\"container\"><div class=\"row\"><div class=\"col-lg-4\"><center><h1>30</h1><h2>Сообществ</h2></center></div><div class=\"col-lg-4\"><center><h1>500+</h1><h2>Митапов в год</h2></center></div><div class=\"col-lg-4\"><center><h1>2000</h1><h2>Специалистов</h2></center></div></div></div><hr><div class=\"container\"><div class=\"row\"><div class=\"col-lg-6\"><div class=\"anu alf akz\"><h4 class=\"anv anw\">Ближайшие митапы</h4></div><div class=\"forthcoming-events list-group\"><a ng-repeat=\"event in events\" href=\"#/events/{{event.id}}\" class=\"event list-group-item\"><h4><small class=\"date pull-right badge\">{{event.start | moment}}</small>{{event.title}}</h4><h5>{{event.community.name}}<address class=\"pull-right\"><i class=\"fa fa-map-marker\"></i> Большая морская 19</address></h5></a><a href=\"#/events\" class=\"more list-group-item\">Посмотреть все митапы</a></div></div><div class=\"col-lg-6\"><div class=\"anu alf akz\"><h4 class=\"anv anw\">Новые сообщества</h4></div><div class=\"fresh-communities list-group\"><a ng-repeat=\"community in communities\" href=\"#/communities/{{community.id}}\" class=\"list-group-item\"><h4><small class=\"date pull-right badge\">{{community.created_at | moment}}</small>{{ community.name}}</h4><div class=\"info\"><i class=\"fa fa-users\"></i> участников – {{community.members_count + 10}}&nbsp;&nbsp;&nbsp;<i class=\"fa fa-flag\"></i> встречь – {{7}}</div></a><a href=\"#/communities\" class=\"more list-group-item\">Посмотреть все сообщества</a></div></div></div></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("index.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 3 */
/***/ function(module, exports) {

	var v1="<div class=\"container\"><dl><dt>Name</dt><dd>{{ profile.name }}</dd><dt>Avatar</dt><dd><img src=\"{{ profile.avatar }}\"></dd></dl><pre>{{profile | json}}</pre></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("profile.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 4 */
/***/ function(module, exports) {

	var v1="<div class=\"container\"><div class=\"row\"><div class=\"content col-lg-8\"><div class=\"list-group\"><a ng-repeat=\"event in events\" href=\"#/events/{{event.id}}\" class=\"event list-group-item\"><h4>{{event.title}}</h4><div class=\"calendar\"><div class=\"date\">{{event.start | date:'dd'}}</div><div class=\"month\">{{event.start | date:'MMMM'}}</div></div><div class=\"tail\"><div class=\"time\">{{event.start | date: 'HH:mm'}} - {{event.finish | date: 'HH:mm'}}</div><div class=\"loc\">{{event.location.display}}</div></div></a></div></div><div class=\"content col-lg-4\"><div class=\"row\"><div class=\"col-lg-12\"><a href=\"#/events/new\" class=\"btn btn-primary btn-lg btn-block\">Добавить</a></div></div><div class=\"row\"><div class=\"col-lg-12\"><hr><calendar selected=\"day\"></calendar></div></div></div></div></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("events.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 5 */
/***/ function(module, exports) {

	var v1="<div class=\"container\"><div class=\"event\"><div class=\"calendar\"><div class=\"date\">{{event.start | date:'dd'}}</div><div class=\"month\">{{event.start | date:'MMMM'}}</div></div><div class=\"title-blk\"><div class=\"title\">{{event.title }}</div><div ng-bind-html=\"event.description | rawHtml\" class=\"subtitle\"></div></div><div class=\"tail\"><div class=\"time\">{{event.start | date: 'HH:mm'}} - {{event.finish | date: 'HH:mm'}}</div><div class=\"loc\">{{event.location.display}}</div></div></div></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("event.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 6 */
/***/ function(module, exports) {

	var v1="<div style=\"width: 40em\" class=\"container\"><hr>{{ event | json }}<form ng-submit=\"save()\"><h3>New Event</h3><div ng-if=\"hasError('base')\" ng-repeat=\"error in errors['base']\" class=\"help-block\"><p>{{ error }}</p></div><hr><div ng-class=\"{ 'has-error': hasError('title') }\" class=\"form-group\"><label for=\"title\">Title</label><input type=\"text\" ng-model=\"event.title\" class=\"form-control\"><div ng-if=\"hasError('title')\" ng-repeat=\"error in errors['title']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('community') }\" class=\"form-group\"><label>Community</label><select type=\"text\" ng-model=\"event.community_id\" selectize=\"communityConfig()\" class=\"form-control\"></select><div ng-if=\"hasError('community')\" ng-repeat=\"error in errors['community']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': (hasError('start') || hasError('finish')) }\" class=\"form-group\"><label for=\"start\">Time</label><div class=\"form-inline\"><div class=\"input-group\"><div class=\"input-group-addon\">from</div><input type=\"text\" ng-datetime-model=\"event.start\" placeholder=\"From\" timepicker class=\"form-control\"><div class=\"input-group-addon\">to</div><input type=\"text\" ng-datetime-model=\"event.finish\" placeholder=\"To\" timepicker class=\"form-control\"></div></div><div ng-if=\"hasError('finish')\" ng-repeat=\"error in errors['finish']\" class=\"help-block\"><p>{{ error }}</p></div><div ng-if=\"hasError('start')\" ng-repeat=\"error in errors['start']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('location') }\" class=\"form-group\"><label>Location</label><select type=\"text\" ng-model=\"event.location\" yandexgeo class=\"form-control\"></select><div ng-if=\"hasError('start')\" ng-repeat=\"error in errors['location']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('tags') }\" class=\"form-group\"><label for=\"tags\">Tags</label><input type=\"text\" ng-model=\"event.tags\" selectize=\"tagsConfig()\" class=\"form-control\"><div ng-if=\"hasError('tags')\" ng-repeat=\"error in errors['tags']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('description') }\" class=\"form-group\"><label>Description (markdown)</label><textarea ng-model=\"event.description\" epiceditor=\"descriptionConfig()\" rows=\"10\" class=\"form-control\"></textarea><div ng-if=\"hasError('description')\" ng-repeat=\"error in errors['description']\" class=\"help-block\"><p>{{ error }}</p></div></div><hr><button type=\"submit\" class=\"btn btn-new\">Submit</button>&nbsp;<a href=\"#/events\" class=\"btn btn-default\">Cancel</a></form></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("new_event.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 7 */
/***/ function(module, exports) {

	var v1="<div class=\"container toolbox\"><form></form></div><div class=\"container\"><a href=\"#/communities/new\" class=\"btn btn-primary btn-lg pull-right\">Добавить</a><br><br><br><ul class=\"communities\"><li ng-repeat=\"e in communities\" style=\"background-image: url({{ e.logo }})\" class=\"community panel pull-left\"><b class=\"index\">{{ e.id }}</b><a href=\"#/communities/{{e.id}}\" class=\"element pull-right\">{{ e.elem }}</a><ul class=\"properties\"><li class=\"name\"><i class=\"fa fa-circle\"></i> {{e.name}}</li><li class=\"members\"><i class=\"fa fa-users\"></i> {{e.members_count + 10 }}</li><li class=\"meetups\"><i class=\"fa fa-flag\"></i> {{ 7 }}</li></ul></li></ul></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("communities.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 8 */
/***/ function(module, exports) {

	var v1="<div class=\"container\"><div class=\"row\"><div class=\"col-lg-3\"><div class=\"thumbnail\"><img src=\"{{community.logo}}\"></div></div><div class=\"col-lg-9\"><h2> {{community.name}}</h2><p ng-bind-html=\"community.description | rawHtml\" class=\"lead\"></p><button ng-click=\"join()\" ng-show=\"currentUser\" ng-if=\"isNotMember()\" class=\"btn btn-primary\">Присоединиться</button><button ng-click=\"leave()\" ng-show=\"currentUser\" ng-if=\"isMember()\" class=\"btn btn-primary\">Выйти из сообщества</button></div></div><div class=\"row\"><div class=\"col-lg-6\"><div class=\"forthcoming-events list-group\"><a ng-repeat=\"event in events\" href=\"#/events/{{event.id}}\" class=\"event list-group-item\"><h4><small class=\"date pull-right badge\">{{event.start | moment}}</small>{{event.title}}</h4><h5>{{event.community.name}}<address class=\"pull-right\"><i class=\"fa fa-map-marker\"></i> Большая морская 19</address></h5></a></div></div><div class=\"col-lg-6\"><ul class=\"members list-group\"><a ng-repeat=\"user in community.users\" href=\"#/users/{{user.id}}\" class=\"user list-group-item\"><div class=\"row\"><div class=\"col-lg-2\"><img src=\"{{user.avatar}}\" class=\"img-circle\"></div><div class=\"col-lg-10\"><h4>{{user.name}}</h4></div></div></a></ul></div></div></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("community.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 9 */
/***/ function(module, exports) {

	var v1="<div style=\"width: 40em\" class=\"container\"><form ng-submit=\"save()\" novalidate name=\"form\" ng-controller=\"NewCommunityCtrl\"><h3>New Community</h3><div ng-if=\"hasError('base')\" ng-repeat=\"error in errors['base']\" class=\"help-block\"><p>{{ error }}</p></div><hr><div ng-class=\"{ 'has-error': hasError('name') }\" class=\"form-group\"><label for=\"name\">Name</label><input type=\"text\" ng-model=\"community.name\" class=\"form-control\"><div ng-if=\"hasError('name')\" ng-repeat=\"error in errors['name']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('short_name') }\" class=\"form-group\"><label for=\"short_name\">Short name</label><input type=\"text\" ng-model=\"community.short_name\" class=\"form-control\"><div ng-if=\"hasError('short_name')\" ng-repeat=\"error in errors['short_name']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('links') }\" class=\"form-group\"><label for=\"links\">Links</label><input type=\"text\" ng-model=\"community.links\" class=\"form-control\"><div ng-if=\"hasError('links')\" ng-repeat=\"error in errors['links']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('logo') }\" class=\"form-group\"><label for=\"logo\">Logo</label><div ngf-select=\"\" ngf-drop=\"\" ng-model=\"logo\" accept=\"image/*\" class=\"drop-box ng-pristine ng-valid\"><img ngf-src=\"logo\" class=\"preview\"></div><div ng-if=\"hasError('logo')\" ng-repeat=\"error in errors['logo']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('hashtag') }\" class=\"form-group\"><label for=\"hashtag\">Hashtag</label><input type=\"text\" ng-model=\"community.hashtag\" class=\"form-control\"><div ng-if=\"hasError('hashtag')\" ng-repeat=\"error in errors['hashtag']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('tags') }\" class=\"form-group\"><label for=\"tags\">Tags</label><input type=\"text\" ng-model=\"community.tags\" selectize=\"tagsConfig()\" class=\"form-control\"><div ng-if=\"hasError('tags')\" ng-repeat=\"error in errors['tags']\" class=\"help-block\"><p>{{ error }}</p></div></div><div ng-class=\"{ 'has-error': hasError('description') }\" class=\"form-group\"><label for=\"description\">Description (markdown)</label><textarea ng-model=\"community.description\" epiceditor=\"descriptionConfig()\" rows=\"10\" class=\"form-control\"></textarea><div ng-if=\"hasError('description')\" ng-repeat=\"error in errors['description']\" class=\"help-block\"><p>{{ error }}</p></div></div><button type=\"submit\" class=\"btn btn-new\">Submit</button>&nbsp;<a href=\"#/communities\" class=\"btn btn-default\">Cancel</a></form></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("new_community.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 10 */
/***/ function(module, exports) {

	var v1="<div class=\"header\"><i ng-click=\"previous()\" class=\"fa fa-angle-left\"></i><span>{{month.format(\"MMMM, YYYY\")}}</span><i ng-click=\"next()\" class=\"fa fa-angle-right\"></i></div><div class=\"week names\"><span class=\"day\">Sun</span><span class=\"day\">Mon</span><span class=\"day\">Tue</span><span class=\"day\">Wed</span><span class=\"day\">Thu</span><span class=\"day\">Fri</span><span class=\"day\">Sat</span></div><div ng-repeat=\"week in weeks\" class=\"week\"><span ng-class=\"{ today: day.isToday, 'different-month': !day.isCurrentMonth, selected: day.date.isSame(selected) }\" ng-click=\"select(day)\" ng-repeat=\"day in week.days\" class=\"day\">{{day.number}}</span></div>";
	window.angular.module(["ng"]).run(["$templateCache",function(c){c.put("calendar.jade", v1)}]);
	module.exports=v1;

/***/ },
/* 11 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin

/***/ },
/* 12 */,
/* 13 */,
/* 14 */,
/* 15 */
/***/ function(module, exports) {

	var app;

	app = angular.module('app');

	app.factory('Menu', function($rootScope) {
	  var calculateCurrent;
	  calculateCurrent = function(menu) {
	    var active, candidats, i, len, x;
	    candidats = [];
	    for (i = 0, len = menu.length; i < len; i++) {
	      x = menu[i];
	      delete x.active;
	      if (window.location.href.indexOf(x.href) > -1) {
	        candidats.push(x);
	      }
	    }
	    active = candidats.sort(function(x, y) {
	      return y.href.localeCompare(x.href);
	    })[0];
	    return active && (active.active = true);
	  };
	  $rootScope.$on('$locationChangeSuccess', function() {
	    return calculateCurrent($rootScope.menu);
	  });
	  return {
	    init: function(user) {
	      var menu;
	      menu = [
	        {
	          display: "События",
	          href: '#/events'
	        }
	      ];
	      menu.push({
	        display: "Сообщества",
	        href: "#/communities"
	      });
	      calculateCurrent(menu);
	      return $rootScope.menu = menu;
	    }
	  };
	});


/***/ },
/* 16 */
/***/ function(module, exports) {

	var app, with_deff;

	app = angular.module("app");

	with_deff = function($q, cb) {
	  var deff;
	  deff = $q.defer();
	  cb(deff);
	  return deff.promise;
	};

	app.factory("Data", function($http, $q, $cookies, Upload) {
	  return {
	    profile: function() {
	      return with_deff($q, function(deff) {
	        return $http({
	          method: "GET",
	          url: "/profile.json"
	        }).success(function(data) {
	          return deff.resolve(data);
	        });
	      });
	    },
	    events: {
	      find: function(id) {
	        return with_deff($q, function(deff) {
	          return $http({
	            method: "GET",
	            url: "/events/" + id + ".json"
	          }).success(function(data) {
	            return deff.resolve(data.event);
	          });
	        });
	      },
	      all: function(params) {
	        return with_deff($q, function(deff) {
	          return $http({
	            method: "GET",
	            url: "/events.json",
	            params: params
	          }).success(function(data) {
	            return deff.resolve(data.events);
	          });
	        });
	      },
	      create: function(params) {
	        return with_deff($q, function(deff) {
	          return $http({
	            method: "POST",
	            url: "/events.json",
	            data: {
	              "event": params || {}
	            }
	          }).then(function(data) {
	            return deff.resolve(data);
	          }, function(data) {
	            return deff.resolve(data);
	          });
	        });
	      }
	    },
	    communities: {
	      all: function(params) {
	        return with_deff($q, function(deff) {
	          return $http({
	            method: "GET",
	            url: "/communities.json",
	            params: params
	          }).success(function(data) {
	            return deff.resolve(data.communities);
	          });
	        });
	      },
	      find: function(id) {
	        return with_deff($q, function(deff) {
	          return $http({
	            method: "GET",
	            url: "/communities/" + id + ".json"
	          }).success(function(data) {
	            return deff.resolve(data.community);
	          });
	        });
	      },
	      create: function(params, logo) {
	        console.log(params, logo);
	        return Upload.upload({
	          url: "/communities.json",
	          method: "POST",
	          fields: params || {},
	          fileFormDataName: "community[logo]",
	          file: logo,
	          formDataAppender: function(fd, key, val) {
	            if (angular.isArray(val)) {
	              angular.forEach(val, function(v) {
	                return fd.append("community[" + key + "]", v);
	              });
	            } else {
	              fd.append("community[" + key + "]", val);
	            }
	            return console.log("fd", fd);
	          }
	        });
	      },
	      join: function(id) {
	        return with_deff($q, function(deff) {
	          return $http({
	            method: "POST",
	            url: "/communities/" + id + "/membership.json"
	          }).success(function(data) {
	            return deff.resolve(data);
	          });
	        });
	      },
	      leave: function(id) {
	        return with_deff($q, function(deff) {
	          return $http({
	            method: "DELETE",
	            url: "/communities/" + id + "/membership.json"
	          }).success(function(data) {
	            return deff.resolve(data);
	          });
	        });
	      }
	    }
	  };
	});


/***/ },
/* 17 */
/***/ function(module, exports) {

	var app;

	app = angular.module('app');

	app.directive('selectize', function($timeout) {
	  return {
	    restrict: 'A',
	    scope: false,
	    link: function(scope, element, attrs) {
	      return $timeout(function() {
	        var opts;
	        opts = scope.$eval(attrs.selectize);
	        opts.onChange = function(value) {
	          return scope.$apply(function() {
	            var root, scopename;
	            root = scope;
	            scopename = $(element).attr('ng-model').split('.');
	            return $.each(scopename, function(index, propery) {
	              if (index === (scopename.length - 1)) {
	                return root[propery] = value;
	              } else {
	                return root = root[propery];
	              }
	            });
	          });
	        };
	        return $(element).selectize(opts);
	      });
	    }
	  };
	});

	app.directive('epiceditor', function($timeout) {
	  return {
	    restrict: 'A',
	    scope: false,
	    link: function(scope, element, attrs) {
	      return $timeout(function() {
	        var editor, options;
	        options = scope.$eval(attrs.epiceditor);
	        options.container = element[0].parentNode;
	        options.textarea = element[0];
	        $(options.textarea).hide();
	        editor = new EpicEditor(options);
	        editor.load();
	        editor.on('update', function(value) {
	          return scope.$apply(function() {
	            var root, scopename;
	            root = scope;
	            scopename = $(element).attr('ng-model').split('.');
	            return $.each(scopename, function(index, propery) {
	              if (index === (scopename.length - 1)) {
	                return root[propery] = value.content;
	              } else {
	                return root = root[propery];
	              }
	            });
	          });
	        });
	        return $(options.container).attr('style', '');
	      });
	    }
	  };
	});

	app.directive('timepicker', function($timeout) {
	  return {
	    restrict: 'A',
	    scope: false,
	    link: function(scope, element, attrs) {
	      return $timeout(function() {
	        return $(element).datetimepicker().on('dp.change', function(ev) {
	          return scope.$parent.$apply(function() {
	            var root, scopename;
	            root = scope;
	            scopename = $(element).attr('ng-datetime-model').split('.');
	            return $.each(scopename, function(index, propery) {
	              if (index === (scopename.length - 1)) {
	                return root[propery] = ev.date.toJSON();
	              } else {
	                return root = root[propery];
	              }
	            });
	          });
	        });
	      });
	    }
	  };
	});

	app.directive('yandexgeo', function($timeout) {
	  var options;
	  options = function() {
	    return {
	      valueField: 'coordinates',
	      labelField: 'coordinates',
	      searchField: 'address',
	      options: [],
	      create: false,
	      load: function(query, callback) {
	        if (!query.length) {
	          callback();
	        }
	        console.log('geoqeury', query);
	        return ymaps.geocode(query).then(function(result) {
	          var data;
	          data = [];
	          result.geoObjects.each(function(geoObject) {
	            var coordinates;
	            coordinates = geoObject.geometry.getCoordinates();
	            return data.push({
	              address: geoObject.properties.get('name'),
	              coordinates: coordinates
	            });
	          });
	          return callback(data);
	        });
	      },
	      render: {
	        item: function(item, escape) {
	          return "<div>" + (escape(item.address)) + "</div>";
	        },
	        option: function(item, escape) {
	          return "<div>" + (escape(item.address)) + "</div>";
	        }
	      }
	    };
	  };
	  return {
	    restrict: 'A',
	    scope: false,
	    link: function(scope, element, attrs, modelCtrl) {
	      return $timeout(function() {
	        var opts;
	        opts = options();
	        opts.onChange = function(value) {
	          return scope.$apply(function() {
	            var root, scopename;
	            root = scope;
	            scopename = $(element).attr('ng-model').split('.');
	            return $.each(scopename, function(index, propery) {
	              if (index === (scopename.length - 1)) {
	                return root[propery] = value;
	              } else {
	                return root = root[propery];
	              }
	            });
	          });
	        };
	        return $(element).selectize(opts);
	      });
	    }
	  };
	});

	app.directive("calendar", function() {
	  var build_month, build_week, remove_time;
	  remove_time = function(date) {
	    return date.day(0).hour(0).minute(0).second(0).millisecond(0);
	  };
	  build_month = function(scope, start, month) {
	    var count, date, done, monthIndex, results;
	    scope.weeks = [];
	    done = false;
	    date = start.clone();
	    monthIndex = date.month();
	    count = 0;
	    results = [];
	    while (!done) {
	      scope.weeks.push({
	        days: build_week(date.clone(), month)
	      });
	      date.add(1, "w");
	      done = count++ > 2 && monthIndex !== date.month();
	      results.push(monthIndex = date.month());
	    }
	    return results;
	  };
	  build_week = function(date, month) {
	    var days, i;
	    days = [];
	    i = 0;
	    while (i < 7) {
	      days.push({
	        name: date.format("dd").substring(0, 1),
	        number: date.date(),
	        isCurrentMonth: date.month() === month.month(),
	        isToday: date.isSame(new Date(), "day"),
	        date: date
	      });
	      date = date.clone();
	      date.add(1, "d");
	      i++;
	    }
	    return days;
	  };
	  return {
	    restrict: "E",
	    templateUrl: "calendar.jade",
	    scope: false,
	    link: function(scope) {
	      var start;
	      scope.selected = remove_time(scope.selected || moment());
	      scope.month = scope.selected.clone();
	      start = scope.selected.clone();
	      start.date(1);
	      remove_time(start.day(0));
	      build_month(scope, start, scope.month);
	      scope.next = function() {
	        var next;
	        next = void 0;
	        next = scope.month.clone();
	        remove_time(next.month(next.month() + 1).date(1));
	        scope.month.month(scope.month.month() + 1);
	        return build_month(scope, next, scope.month);
	      };
	      return scope.previous = function() {
	        var previous;
	        previous = void 0;
	        previous = scope.month.clone();
	        remove_time(previous.month(previous.month() - 1).date(1));
	        scope.month.month(scope.month.month() - 1);
	        return build_month(scope, previous, scope.month);
	      };
	    }
	  };
	});


/***/ }
/******/ ]);