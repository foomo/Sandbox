<?php

/* @var $model Foomo\Sandbox\Frontend\Model */
/* @var $view Foomo\MVC\View */

// \Foomo\Bundle\Compiler::addBundleToDoc('Foomo\\Sandbox\\Bundles::app');

// simulate production
//
\Foomo\Bundle\Compiler::addBundleToDoc('Foomo\\Sandbox\\Bundles::app', array(false), null, false);

?>
<h1><?= $view->_e('APP_NAME') ?></h1>