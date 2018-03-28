<?php

use Carbon\Carbon;
use WHMCS\User\Client;
use WHMCS\Config\Setting;
use WHMCS\View\Menu\Item;
use \Illuminate\Database\Capsule\Manager as Capsule;

if (!empty($_SESSION['uid'])) {
	
	//用户中心首页 公告列表
	add_hook('ClientAreaPageHome', 1, function ($vars) {
	
	    $response = Capsule::table('tblannouncements')->where('published', '1')->orderBy('id', 'DESC')->get();

	    foreach ( $response as $key => $value ) {
			//if ($key >=4) break;
		    $ann[$key]['id'] 	= $value->id;
		    $ann[$key]['title'] = $value->title;
		    $ann[$key]['rawDate'] 	= $value->date;
		    $ann[$key]['date'] 	= $value->date;
		    $ann[$key]['text'] 	= $value->announcement;
		    $ann[$key]['summary'] 	= $value->announcement;
	    }
	    return [
		    'announcements' => $ann,
	    ];
	
	});
	
	//用户中心首页 产品列表
	add_hook('ClientAreaPageHome', 1, function ($vars) {
	
		$userid 	= $vars['clientsdetails']['userid'];
		$services = Capsule::table('tblhosting')->where('userid', $userid)->where('domainstatus', 'Active')->orderBy('id', 'DESC')->get();
	
		//print_r($results);die();
		foreach ( $services as $key => $value ) {
			$NWProducts[$key]['name'] 			= Capsule::table('tblproducts')->where('id', $value->packageid)->first()->name;
			$NWProducts[$key]['id']				= $value->id;
			$NWProducts[$key]['domain']			= $value->domain;
			$NWProducts[$key]['nextduedate']	= $value->nextduedate;
	    }
	
		return [
			'NWProducts' => $NWProducts,
		];
	});
}