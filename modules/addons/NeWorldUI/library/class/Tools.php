<?php
// 命名空间
namespace UI_Manager;

// 引入初始化类
require_once dirname(__DIR__).'/init.php';

// 使用其他命名空间的方法
use WHMCS\Database\Capsule;
use WHMCS\Config\Setting;

// 工具类
class Tools {
    // 将构造方法添加 private 修饰符可防止实例化
    private function __construct() {
	    
    }
    
    // 获取模板目录
    public function filePath() {
		$templatename = Setting::getValue('Template');
		$file_path = dirname(dirname(dirname(dirname(dirname(__DIR__))))) . '/templates/'.$templatename.'/includes/custom/';
		return $file_path;
	}
    
    // 获取文件
    public static function fileGet( $filename ) {
		$file_path = Tools::filePath() . $filename;
		if ( file_exists ( $file_path ) ){
			$filevalue = file_get_contents( $file_path ); //将整个文件内容读取
			return $filevalue;
		}
	}
	
	//写入文件
    public static function fileSet( $filename, $fileValue ) {
		$file_path = Tools::filePath() . $filename;
		file_put_contents($file_path, htmlspecialchars_decode($fileValue)); //将整个文件内容写入
	}
}