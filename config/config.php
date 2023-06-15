<?php
require "../library/Smarty/libs/Smarty.class.php";

define("PathPrefix", "../controls/");
define("PathPostfix", "Controller.php");

$template = "default";
$smarty = new Smarty();

define("TemplatePrefix", "../views/{$template}");
define("TemplatePostfix", ".tpl");
define("TemplatePath", "/templates/default");
$smarty -> setTemplateDir(TemplatePrefix);
$smarty -> setCompileDir("../tmp/smarty/template_c");
$smarty -> setCacheDir("../tmp/smarty/cache");
$smarty -> setConfigDir("../library/Smarty/configs");
$smarty -> assign("templateWebPath", TemplatePath);
