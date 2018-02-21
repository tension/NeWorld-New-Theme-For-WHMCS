<div class="c-login c-register">
    <header class="c-login__head">
	    <a href="{$systemurl}" class="c-login_brand">
            {$companyname}
        </a>
    </header>
    
	<div class="c-login__content">
		{if in_array('state', $optionalFields)}
		    <script>
		        var statesTab = 10;
		        var stateNotRequired = true;
		    </script>
		{/if}
		
		<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
		<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
		<script>
		    window.langPasswordStrength = "{$LANG.pwstrength}";
		    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
		    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
		    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
		    jQuery(document).ready(function()
		    {
		        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
		    });
		</script>
		{if $registrationDisabled}
		    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.registerCreateAccount|cat:' <strong><a href="cart.php" class="alert-link">'|cat:$LANG.registerCreateAccountOrder|cat:'</a></strong>'}
		{/if}
		
		{if $errormessage}
		    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
		{/if}
		
		{if !$registrationDisabled}
		<div id="registration" class="u-p-zero">
		    <form method="post" class="using-password-strength" action="{$smarty.server.PHP_SELF}" role="form" name="orderfrm" id="frmCheckout">
		        <input type="hidden" name="register" value="true"/>
                <input type="hidden" name="country" value="CN" />
                <input type="hidden" name="state" value="{$LANG.clientareastate}" />
                <input type="hidden" name="city" value="" />
                <input type="hidden" name="postcode" value="" />
                <input type="hidden" name="companyname" value="" />
                <input type="hidden" name="address1" value="" />
                <input type="hidden" name="address2" value="" />
		
		        <div id="containerNewUserSignup">
		
		            {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}
		            
		            <div class="row">
		                <div class="col-12">
		                    <div class="c-field u-mb-small prepend-icon">
		                        <label for="inputEmail" class="field-icon">
		                            <i class="fa fa-envelope"></i>
		                        </label>
		                        <input type="email" name="email" id="inputEmail" class="field c-input" placeholder="{$LANG.orderForm.emailAddress}" value="{$clientemail}"autofocus>
		                    </div>
		                </div>
		                <div class="col-sm-6">
		                    <div class="c-field u-mb-small prepend-icon">
		                        <label for="inputlastName" class="field-icon">
		                            <i class="fa fa-user"></i>
		                        </label>
		                        <input type="text" name="lastname" id="inputlastName" class="field c-input" placeholder="{$LANG.orderForm.lastName}" value="{$clientfirstname}" {if !in_array('lastname', $optionalFields)}required{/if} >
		                    </div>
		                </div>
		                <div class="col-sm-6">
		                    <div class="c-field u-mb-small prepend-icon">
		                        <label for="inputFirstName" class="field-icon">
		                            <i class="fa fa-user"></i>
		                        </label>
		                        <input type="text" name="firstname" id="inputFirstName" class="field c-input" placeholder="{$LANG.orderForm.firstName}" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} >
		                    </div>
		                </div>
		                <div class="col-12">
		                    <div class="c-field u-mb-small prepend-icon">
		                        <label for="inputPhone" class="field-icon">
		                            <i class="fa fa-phone"></i>
		                        </label>
		                        <input type="tel" name="phonenumber" id="inputPhone" class="field c-input" placeholder="{$LANG.orderForm.phoneNumber}" value="{$clientphonenumber}">
		                    </div>
		                </div>
		            </div>
		            {if $customfields || $currencies}
		            <span class="c-divider has-text c-divider--small u-mv-medium">{$LANG.orderadditionalrequiredinfo}</span>
		            <div class="row">
		                {if $customfields}
		                {foreach $customfields as $customfield}
		                    <div class="col-sm-12">
		                        <div class="c-field u-mb-small">
		                            <label for="customfield{$customfield.id}">{$customfield.name}</label>
		                            <div class="control">
		                                {$customfield.input}
		                            {if $customfield.description}
		                                <span class="field-help-text">{$customfield.description}</span>
		                            {/if}
		                            </div>
		                        </div>
		                    </div>
		                {/foreach}
		                {/if}
		                {if $customfields && count($customfields)%2 > 0 }
		                    <div class="clearfix"></div>
		                {/if}
		                {if $currencies}
		                <div class="col-sm-12">
		                    <div class="c-field u-mb-small prepend-icon">
		                        <label for="inputCurrency" class="field-icon">
		                            <i class="fa fa-money"></i>
		                        </label>
		                        <select id="inputCurrency" name="currency" class="field c-input">
		                            {foreach from=$currencies item=curr}
		                                <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
		                            {/foreach}
		                        </select>
		                    </div>
		                </div>
		                {/if}
		            </div>
					{/if}
		        </div>
		        <div id="containerNewUserSecurity" {if $remote_auth_prelinked && !$securityquestions } class="hidden"{/if}>
		
		            <span class="c-divider has-text c-divider--small u-mv-medium">{$LANG.orderForm.accountSecurity}</span>
		            
		            <div id="containerPassword" class="row{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
		                <div id="passwdFeedback" style="display: none;" class="alert alert-info text-center col-sm-12"></div>
		                <div class="col-12">
		                    <div class="c-field u-mb-small prepend-icon">
		                        <label for="inputNewPassword1" class="field-icon">
		                            <i class="fa fa-lock"></i>
		                        </label>
		                        <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="field" placeholder="{$LANG.clientareapassword}" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
		                    </div>
		                </div>
		                <div class="col-12">
		                    <div class="c-field u-mb-small prepend-icon">
		                        <label for="inputNewPassword2" class="field-icon">
		                            <i class="fa fa-lock"></i>
		                        </label>
		                        <input type="password" name="password2" id="inputNewPassword2" class="field" placeholder="{$LANG.clientareaconfirmpassword}" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
		                    </div>
		                </div>
		                <div class="col-12">
		                    <div class="progress">
		                        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
		                        </div>
		                    </div>
		                </div>
		                <div class="col-12 hide">
		                    <p class="text-center small text-muted" id="passwordStrengthTextLabel">{$LANG.pwstrength}: {$LANG.pwstrengthenter}</p>
		                </div>
		            </div>
		            {if $securityquestions}
		            <div class="row">
		                <div class="c-field u-mb-small col-12">
		                    <select name="securityqid" id="inputSecurityQId" class="field c-input">
		                        <option value="">{$LANG.clientareasecurityquestion}</option>
		                        {foreach $securityquestions as $question}
		                            <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
		                                {$question.question}
		                            </option>
		                        {/foreach}
		                    </select>
		                </div>
		                <div class="col-sm-6">
		                    <div class="c-field u-mb-small prepend-icon">
		                        <label for="inputSecurityQAns" class="field-icon">
		                            <i class="fa fa-lock"></i>
		                        </label>
		                        <input type="password" name="securityqans" id="inputSecurityQAns" class="field c-input" placeholder="{$LANG.clientareasecurityanswer}" autocomplete="off">
		                    </div>
		                </div>
		            </div>
		            {/if}
		        </div>
		
		        <div class="u-mb-small">
		        	{include file="$template/includes/captcha.tpl"}
		        </div>
		        {if $accepttos}
		            <div class="row">
		                <div class="col-md-12">
		                    <div class="panel panel-danger tospanel">
		                        <div class="panel-heading">
		                            <h3 class="panel-title"><span class="fa fa-exclamation-triangle tosicon"></span> &nbsp; {$LANG.ordertos}</h3>
		                        </div>
		                        <div class="panel-body">
		                            <div class="col-md-12">
		                                <label class="checkbox">
		                                    <input type="checkbox" name="accepttos" class="accepttos">
		                                    {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
		                                </label>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        {/if}
	
				<button class="c-btn c-btn--info c-btn--fullwidth" type="submit">{$LANG.signup}</button>
		    </form>
		</div>
		{/if}
	</div>
	
	<footer class="c-login__footer">
	    <a class="c-login__footer-link" onclick="window.history.back();">{$LANG.clientareabacklink}</a>
		<a class="c-login__footer-link pull-right" href="login.php">{$LANG.login}</a>
    </footer>
</div>
