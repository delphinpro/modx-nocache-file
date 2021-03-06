<?php
/**
 * nocache
 *
 * Добавляет хеш файла в параметр для предотвращения кеширования обновленной статики
 *
 * @category    system
 * @version     1.0.1
 * @license     MIT
 * @author      delphinpro
 * @internal    @modx_category System
 */

$file = isset($file) ? $file : '';
$cacheable = isset($cacheable) ? intval($cacheable) : 0; // 1 or 0

if (empty($file)) {
	return;
}

$filePath = MODX_BASE_PATH . $file;

if (!file_exists($filePath) || !is_readable($filePath)) {
    return;
}

$md5File = '';
if ($cacheable === 0) {
  $md5 = md5_file($filePath);
	$md5File = '?v='.substr($md5, 0, 7);
}

return $file.$md5File;
