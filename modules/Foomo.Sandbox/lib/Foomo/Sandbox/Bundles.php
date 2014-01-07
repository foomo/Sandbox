<?php

/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */

namespace Foomo\Sandbox;

use Foomo\Config;

/**
 * @link www.foomo.org
 * @license www.gnu.org/licenses/lgpl.txt
 */
class Bundles
{
	public static function app($debug = null)
	{
		$debug = self::getDebug($debug);
		return \Foomo\Less\Bundle::create('site-css', Module::getBaseDir('less') . DIRECTORY_SEPARATOR . 'Frontend.less')
			->debug($debug)
			->merge(
				\Foomo\Less\Bundle::create('another-site-css', Module::getBaseDir('less') . DIRECTORY_SEPARATOR . 'Foo.less')
					->debug($debug)
			)
		;
	}
	private static function getDebug($debug)
	{
		if(is_null($debug)) {
			$debug = !Config::isProductionMode();
		}
		return $debug;
	}
}