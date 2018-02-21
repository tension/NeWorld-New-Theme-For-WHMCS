<div class="c-login">
    <header class="c-login__head">
	    <a href="{$systemurl}" class="c-login_brand">
            {$companyname}
        </a>
    </header>
	
	<div class="login-content c-login__content">
		<div class="whmcs-body">
	        
	        {if $loggedin}
		        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.noPasswordResetWhenLoggedIn textcenter=true}
		    {else}
		        {if $success}
		
		            {include file="$template/includes/alert.tpl" type="success" msg=$LANG.pwresetvalidationsent textcenter=true}
		
		            <p>{$LANG.pwresetvalidationcheckemail}</p>
		
		        {else}
		
		            {if $errormessage}
		                {include file="$template/includes/alert.tpl" type="error" msg=$errormessage textcenter=true}
		            {/if}
		
		            {if $securityquestion}
		
		                <p class="u-mb-small">{$LANG.pwresetsecurityquestionrequired}</p>
		
		                <form method="post" action="pwreset.php">
			                
		                    <input type="hidden" name="action" value="reset" />
		                    <input type="hidden" name="email" value="{$email}" />
		
							<div class="c-field u-mb-small">
		                        <label for="inputAnswer" class="c-field__label">{$securityquestion}</label>
		                        <input type="text" name="answer" class="c-input" id="inputAnswer" autofocus>
		                    </div>
		
		                    <div class="c-field u-mb-small">
		                        <button type="submit" class="c-btn c-btn--info c-btn--fullwidth">{$LANG.pwresetsubmit}</button>
		                    </div>
		
		                </form>
		
		            {else}
		
		                <p class="u-mb-small">{$LANG.pwresetemailneeded}</p>
		
		                <form method="post" action="{$systemsslurl}pwreset.php" role="form">
		                    <input type="hidden" name="action" value="reset" />
		
		                    <div class="c-field u-mb-medium">
		                        <label for="inputEmail" class="c-field__label">{$LANG.loginemail}</label>
		                        <input type="email" name="email" class="c-input" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
		                    </div>
		
		                    <div class="">
		                        <button type="submit" class="c-btn c-btn--info c-btn--fullwidth">{$LANG.pwresetsubmit}</button>
		                    </div>
		
		                </form>
		
		            {/if}
		
		        {/if}
		    {/if}
			
		</div>
	</div>
	<footer class="c-login__footer">
	    <a class="c-login__footer-link" onclick="window.history.back();">{$LANG.clientareabacklink}</a>
    </footer>
</div>