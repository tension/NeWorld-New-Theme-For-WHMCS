{if $uiManager['loginmode'] == 'default'}
<div class="c-login">
    <header class="c-login__head">
	    <a href="{$systemurl}" class="c-login_brand">
            {$companyname}
        </a>
    </header>
    
	<form method="post" action="{$systemurl}dologin.php" class="c-login__content" role="form">

	    {if $incorrect}
	        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.loginincorrect textcenter=true}
	    {elseif $verificationId && empty($transientDataName)}
	        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.verificationKeyExpired textcenter=true}
	    {elseif $ssoredirect}
	        {include file="$template/includes/alert.tpl" type="info" msg=$LANG.sso.redirectafterlogin textcenter=true}
	    {/if}
	
	    <div class="providerLinkingFeedback"></div>
		
		<div class="login-content">
			<div class="whmcs-body">
		        <div class="c-field u-mb-small">
		            <label for="inputEmail" class="c-field__label">{$LANG.clientareaemail}</label>
		            <input type="email" name="username" class="c-input" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
		        </div>
		
		        <div class="c-field u-mb-medium">
		            <label for="inputPassword" class="c-field__label">{$LANG.clientareapassword}</label>
		            <input type="password" name="password" class="c-input" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off" >
		        </div>

				<button class="c-btn c-btn--info c-btn--fullwidth" type="submit">{$LANG.loginbutton}</button>
				
			</div>
		</div>
		
        {if $qqlink || $wechatlink}
        <span class="c-divider has-text c-divider--small u-mv-medium">{$LANG.Loginviasocial}</span>
	        
        <div class="row">
	    	<div class="col-lg-6">
		    	{$qqlink}
	    	</div>
	    	<div class="col-lg-6">
				{$wechatlink}
	    	</div>
        </div>
			{if $linkableProviders}
	        <div class="c-login__social">
		        
	            {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
	            
	        </div>
	        {/if}
        {/if}
    </form>
	<footer class="c-login__footer">
    	<a class="c-login__footer-link pull-left" href="register.php">{$LANG.register}</a>
		<a class="c-login__footer-link pull-right" href="pwreset.php">{$LANG.forgotpw}</a>
    </footer>
</div>
{else}
<div class="c-login c-login--horizontal">
    <div class="c-login__content-wrapper">
        <header class="c-login__head">
            <h2 class="c-login__title">{$LANG.login}</h2>
        </header>
        
        <form method="post" action="{$systemurl}dologin.php" class="c-login__content" role="form">
	    {if $incorrect}
	        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.loginincorrect textcenter=true}
	    {elseif $verificationId && empty($transientDataName)}
	        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.verificationKeyExpired textcenter=true}
	    {elseif $ssoredirect}
	        {include file="$template/includes/alert.tpl" type="info" msg=$LANG.sso.redirectafterlogin textcenter=true}
	    {/if}
	
	    <div class="providerLinkingFeedback"></div>
            <div class="c-field u-mb-small">
                <label for="inputEmail" class="c-field__label">{$LANG.clientareaemail}</label> 
                <input class="c-input" type="email" name="username" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus> 
            </div>

            <div class="c-field u-mb-small">
                <label for="inputPassword" class="c-field__label">{$LANG.clientareapassword}</label> 
                <input class="c-input" type="password" name="password" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off"> 
            </div>

            <button class="c-btn c-btn--success c-btn--fullwidth" type="submit">{$LANG.loginbutton}</button>

            <span class="c-divider u-mv-small"></span>
			
			<div class="row">
				<div class="col-sm-6">
					<a href="register.php" class="c-btn c-btn--secondary c-btn--fullwidth">{$LANG.register}</a>
				</div>
				<div class="col-sm-6">
					<a class="c-btn c-btn--secondary c-btn--fullwidth" href="pwreset.php">{$LANG.forgotpw}</a>
				</div>
			</div>
        </form>
    </div>

    <div class="c-login__content-image">
        <img src="{$WEB_ROOT}/templates/{$template}/assets/img/login-right-bg.png" alt="Welcome to {$companyname}">

        <h3>{$uiManager['login2title']}</h3>
        <p class="u-text-large">{$uiManager['login2value']}</p>
    </div>
</div>
{/if}