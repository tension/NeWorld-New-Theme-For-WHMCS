<?php
if (!defined('WHMCS')) {
	die('This file cannot be accessed directly');
}
// NeWorld Manager 开始

// 引入文件
require  ROOTDIR . '/modules/addons/NeWorld/library/class/NeWorld.Common.Class.php';

// NeWorld Manager 结束
require_once __DIR__.'/library/init.php';
use UI_Manager\Tools;
use WHMCS\Database\Capsule;

// 判断函数是否不存在
if (!function_exists('NeWorldUI_config')) {
    // 设置项目
    function NeWorldUI_config() {
        return [
            'name' => 'NeWorld UI Manager',
            'description' => '这是 NeWorld Theme 扩展设置模块',
            'version' => '1.2',
            'author' => '<a target="_blank" href="https://neworld.org/">NeWorld</a>',
        ];
    }
}

// 判断函数是否不存在
if (!function_exists('NeWorldUI_activate')) {
    // 插件激活
	function NeWorldUI_activate() {
		try {
			if (!Capsule::schema()->hasTable('mod_neworld_ui')) {
				Capsule::schema()->create('mod_neworld_ui', function ($table) {
					$table->text('setting');
					$table->text('value');
					$table->dateTime('updated_at')->default('0000-00-00 00:00:00');
				});
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'thememode','value' => 'dark', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'loginmode','value' => 'default', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'login2title','value' => '', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'login2value','value' => '', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'cartmode','value' => 'light', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'statistics','value' => '', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'cssCode','value' => '', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'topCode','value' => '', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'btmCode','value' => '', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
				\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
	            	'setting' => 'indexCode','value' => '', 'updated_at' => date('Y-m-d H:i:s'), 
	            ]);
			}
			if (!Capsule::schema()->hasTable('mod_neworld_ui_menu')) {
				Capsule::schema()->create('mod_neworld_ui_menu', function ($table) {
					$table->increments('id');
					$table->text('type');
					$table->text('title');
					$table->dateTime('date')->default('0000-00-00 00:00:00');
					$table->text('url');
					$table->text('activated');
				});
			}
		} catch (Exception $e) {
			return [
				'status' => 'error',
				'description' => '不能创建表 mod_neworld_ui: ' . $e->getMessage()
			];
		}
		return [
			'status' => 'success',
			'description' => '模块激活成功. 点击 配置 对模块进行设置。'
		];
	}
}

// 判断函数是否不存在
if (!function_exists('NeWorldUI_deactivate')) {
    // 插件卸载
	function NeWorldUI_deactivate() {
		try {
			Capsule::schema()->dropIfExists('mod_neworld_ui');
			Capsule::schema()->dropIfExists('mod_neworld_ui_menu');
			return [
				'status' => 'success',
				'description' => '模块卸载成功'
			];
		} catch (Exception $e) {
			return [
				'status' => 'error',
				'description' => 'Unable to drop tables: ' . $e->getMessage()
			];
		}
	}
}

// 判断函数是否不存在
if (!function_exists('NeWorldUI_upgrade')) {
	// 升级模块
	function NeWorldUI_upgrade($vars) {
	    $version = $vars['version'];
	    
	    # Run SQL Updates for V1.0 to V1.1
	    if ($version < 1.1) {
			\Illuminate\Database\Capsule\Manager::table('mod_neworld_ui')->insert([
            	'setting' => 'cartmode','value' => 'light', 'updated_at' => date('Y-m-d H:i:s'), 
            ]);
	    }
	}
}

// 判断函数是否不存在
if (!function_exists('NeWorldUI_output')) {
    // 插件输出
    function NeWorldUI_output($vars) {
		
	    $modulelink = $vars['modulelink'];
        try {
            // 实例化扩展类
            $ext = new NeWorld\Extended;

            try {
                // 实例化数据库类
                $db = new NeWorld\Database;
                
				$result['action'] = $_REQUEST['action'];
		
		        // 判断是否有 POST
		        if ( !empty( $_POST ) ) {
		            try {
			            
			        	Tools::fileSet('custom.css', $_POST['cssCode']);
			        	Tools::fileSet('header.tpl', $_POST['topCode']);
			        	Tools::fileSet('footer.tpl', $_POST['btmCode']);
			        	Tools::fileSet('index.tpl', $_POST['indexCode']);
			        	
		                // 循环拿到的数组
		                foreach ( $_POST as $setting => $value ) {
		                    // 判断是否 token，是的话跳出进行下一个循环
		                    if ($setting == 'token') continue;
		
		                    // 更新内容到数据库
		                    $db->runSQL([
		                        'action' => [
		                            'update' => [
		                                'sql' => 'UPDATE mod_neworld_ui SET value = ? WHERE setting = ?',
		                                'pre' => [$value, $setting],
		                            ],
		                        ],
		                    ]);
		                }
		
		                // 返回成功的通知
		                $notice = $ext->getSmarty([
		                    'file' => 'tips/success',
		                    'vars' => [
		                        'message' => '操作成功，相应的设置已保存',
		                    ],
		                ]);
		            }
		            catch (Exception $e) {
		                $notice = $ext->getSmarty([
		                    'file' => 'tips/danger',
		                    'vars' => [
		                        'message' => '操作失败，错误信息: '.$e->getMessage(),
		                    ],
		                ]);
		            }
		        }

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
		            // 放到之前声明的关联数组中
		            $setting['topCode'] = Tools::fileGet('header.tpl');
		            $setting['btmCode'] = Tools::fileGet('footer.tpl');
		            $setting['cssCode'] = Tools::fileGet('custom.css');
		            $setting['indexCode'] = Tools::fileGet('index.tpl');
		            $setting[$value['setting']] = $value['value'];
		        }
		
		    	// 默认会返回控制台的变量组
			    $result = [
			        'setting' => $setting,
			        'version' => $vars['version'],
		            'notice' => empty($notice) ? false : $notice,
			    ];
		        
		        $result['PageName'] = 'content';
				$result['assets'] = $ext->getSystemURL().'modules/addons/NeWorldUI/templates/';
				$result['version'] = $vars['version'];
				$result['module'] = $vars['modulelink'];

                // 把 $result 放入模板需要输出的变量组中
                $result = $ext->getSmarty([
					'dir' => __DIR__ . '/templates/',
                    'file' => 'home',
                    'vars' => $result,
                ]);
            }
            catch (Exception $e) {
                // 输出错误信息
                $result = $ext->getSmarty([
                    'file' => 'tips/danger',
                    'vars' => [
                        'message' => $e->getMessage(),
                    ],
                ]);
            }
            finally {
                echo $result;
            }
        }
        catch (Exception $e) {
            // 如果报错则终止并输出错误
            die($e->getMessage());
        }
    }
}