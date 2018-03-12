<?php
if (!defined('WHMCS')) {
	die('This file cannot be accessed directly');
}
use WHMCS\Database\Capsule;
require_once __DIR__.'/library/init.php';
use UI_Manager\Tools;
// NeWorld Manager 开始

// 引入文件
require  ROOTDIR . '/modules/addons/NeWorld/library/class/NeWorld.Common.Class.php';

// NeWorld Manager 结束

add_hook('ClientAreaPage', 1, function ($vars){
    
    // 实例化数据库类
    $db = new NeWorld\Database;
    
	// 读取数据库中的数据
	$getData = $db->runSQL([
	    'action' => [
	        'setting' => [
	            'sql' => 'SELECT * FROM mod_neworld_ui',
	            'all' => true,
	        ],
	    ],
	    'trans' => false,
	]);
	
	// 声明一个空的关联数组
	$setting = [];
	
	// 遍历数据库中读取的信息并且整理数组
	foreach ($getData['setting']['result'] as $value) {
        $setting['topCode'] 	= Tools::fileGet('header.tpl');
        $setting['homeCode'] 	= Tools::fileGet('index.tpl');
        $setting['btmCode'] 	= Tools::fileGet('footer.tpl');
        $setting['cssCode'] 	= Tools::fileGet('custom.css');
	    // 放到之前声明的关联数组中
	    $setting[$value['setting']] = $value['value'];
	}

	//print_r($setting['homeCode']);die();

	return [
		'uiManager' => $setting,
	];
	
});

/*
add_hook('ClientAreaHeadOutput', 1, function($vars) {
	
	$cssCode = Tools::fileGet('custom.css');
	
    if ( !empty( $cssCode ) ) {
        return '<style type="text/css">' . $cssCode . '</style>';
    }
});
*/