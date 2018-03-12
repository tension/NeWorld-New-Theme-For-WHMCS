<!DOCTYPE html>
<!--                                             
  _   _    __        __         _     _                  
 | \ | | __\ \      / /__  _ __| | __| |  ___  _ __ __ _ 
 |  \| |/ _ \ \ /\ / / _ \| '__| |/ _` | / _ \| '__/ _` |
 | |\  |  __/\ V  V / (_) | |  | | (_| || (_) | | | (_| |
 |_| \_|\___| \_/\_/ \___/|_|  |_|\__,_(_)___/|_|  \__, |
                                                   |___/ 
Powered By NeWorld.org
-->

<html lang="{$LANG.locale}">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>

<body class="{if $loginpage eq 0 and $templatefile ne "clientregister" and $filename ne 'logout' and $filename ne 'pwreset'}c-login-wrapper{/if} {$templatefile}" data-phone-cc-input="{$phoneNumberInputStyle}">

{$headeroutput}

{if $loginpage eq 0 and $templatefile ne "clientregister" and $filename ne 'logout' and $filename ne 'pwreset'}

	{if $templatefile ne "homepage" and !$inShoppingCart and $frontend ne "0"}
	
		{include file="$template/includes/common/header.tpl" header="side"}
		<main class="o-page__content">
          
          {include file="$template/includes/common/navbar.tpl"}
	
	{else}
		
		{if $uiManager['cssCode']}
			{if $templatefile eq "homepage" or $inShoppingCart or $frontend eq "0"}
				<link href="{$WEB_ROOT}/templates/{$template}/includes/custom/custom.css?1" rel="stylesheet">
			{/if}
		{/if}
		{* 自定义头部代码 *}
		{if $uiManager['topCode']}
			{include file="$template/includes/custom/header.tpl"}
		{else}
			{include file="$template/includes/common/header.tpl"}
		{/if}
        {if $templatefile eq "homepage" or $inShoppingCart or $frontend eq "0"}
        	<main>
        {else}
			<main class="container u-p-medium">
        {/if}
			
	{/if}
	
	{include file="$template/includes/verifyemail.tpl"}
          
	{if $templatefile ne 'clientareaproductdetails' and $templatefile ne "homepage" and !$inShoppingCart and $frontend ne "0"}
    <div class="container-fluid u-pt-medium">
    {/if}

    {if $templatefile eq 'homepage'}
		{* 自定义首页代码 *}
    	{if $uiManager['homeCode']}
			{include file="$template/includes/custom/index.tpl"}
		{else}
        	{include file="$template/includes/common/index.tpl"}
        {/if}
    {/if}

    {if !$inShoppingCart and ( $templatefile ne 'clientareaproductdetails' and $templatefile ne 'clientareahome' and $templatefile ne "homepage" and $templatefile ne "viewinvoice" ) and $frontend ne "0"}
        <div class="row">
            <!-- Container for main page display content -->
            <div class="page-content col-12">
                <div class="c-card u-mb-medium">
                    {if $displayTitle}
                    <div class="c-card__head">
                        <h5 class="c-card__title">{$displayTitle}</h5>
                    </div>
                    {/if}
    {/if}
	
{/if}