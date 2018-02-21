<div class="c-login">
    <header class="c-login__head">
	    <a href="{$systemurl}" class="c-login_brand">
            {$companyname}
        </a>
    </header>
    
	<div class="c-login__content" style="height: 150px;">

	    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.logoutsuccessful textcenter=true}
	
	    <div class="main-content">
	        <p class="text-center">
	            <a href="index.php" class="btn btn-default c-btn--fullwidth">{$LANG.logoutcontinuetext}</a>
	        </p>
	    </div>
		
    </div>
</div>