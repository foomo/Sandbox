<?php

/* @var $model Foomo\Sandbox\Frontend\Model */
/* @var $view Foomo\MVC\View */

?>
<?= $view->partial('header') ?>
<h2>SAY</h2>
<p><?= $view->escape($model->word) ?></p>
