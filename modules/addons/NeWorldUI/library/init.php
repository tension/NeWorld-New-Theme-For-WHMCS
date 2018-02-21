<?php
// 设置 header，防止乱码
header("Content-Type: text/html; charset=utf-8");

// 禁止非 WHMCS 资源
defined('WHMCS') OR die('Access denied');

try
{
    // 自动载入类，处理类的自动加载
    spl_autoload_register(function ($className)
    {
        // 将类名分开
        $namespace = explode('\\', $className);

        if ($namespace['0'] == 'UI_Manager') {
            // 文件名
            $fileName = __DIR__."/class/{$namespace['1']}";

            // 判断文件是否存在
            if (!file_exists("{$fileName}.php")) throw new Exception("File [ {$fileName}.php ] does not exist");

            // 引入相应的文件
            require_once $fileName.'.php';
        }
    });

    // 仅允许 Linux 系统使用 Geeba 软件
    if (PHP_OS != 'Linux') throw new Exception("only supports Linux operating system");

    // 引入 WHMCS 资源，让使用此文件的程序可以无缝使用 WHMCS 的资源
    require_once dirname(dirname(dirname(dirname(__DIR__)))).'/init.php';
}
catch (Exception $e)
{
    // 结束程序并且返回错误信息
    die("Mail verify module failed to start, Error message: {$e->getMessage()}");
}
