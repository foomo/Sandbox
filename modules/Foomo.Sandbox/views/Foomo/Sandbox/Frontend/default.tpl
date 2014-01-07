<?php

/* @var $model Foomo\Sandbox\Frontend\Model */
/* @var $view Foomo\MVC\View */

?>
<?= $view->partial('header') ?>
<p><?= $view->_e('HELLO_WORLD') ?></p>
<p><?= $view->link($view->_('SAY_BIRD'), 'say', array('bird') ) ?></p>