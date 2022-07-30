<!DOCTYPE html>
<head>
	<link rel="stylesheet" type="text/css" href="styles/resource/css/login/styles.css">
	<link rel="stylesheet" href="styles/resource/font-awesome/4.5.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="styles/resource/css/login/fancybox.css" />
	<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon">

	<title>{block name="title"} - {$gameName}{/block}</title>
	<meta name="generator" content="Space-Tactics {$VERSION}">
	<meta name="keywords" content="Weltraum Browsergame, Space-Tactics, XNova, 2Moons, Space, Private, Server, Speed">
	<meta name="description" content="Space-Tactics Browsergame powerd by https://github.com/ShaoKhan/Space-Tactics.git">
	<meta name="viewport" content="width=device-width" />

	<script src="scripts/login/jquery-3.6.0.min.js"></script>
	<script src="scripts/fancybox.umd.js"></script>
	<script src="scripts/login/main.js"></script>
	<script>{if isset($code)}var loginError = {$code|json};{/if}</script>
	{block name="script"}{/block}	
</head>
<body id="{$smarty.get.page|htmlspecialchars|default:'overview'}" class="{$bodyclass}">