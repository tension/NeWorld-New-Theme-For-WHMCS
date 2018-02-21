{include file="orderforms/{$carttpl}/common.tpl"}
{function name=getFontAwesomeCCIcon}
    {if $ccType eq "Visa"}
        fa-cc-visa
    {elseif $ccType eq "MasterCard"}
        fa-cc-mastercard
    {elseif $ccType eq "Discover"}
        fa-cc-discover
    {elseif $ccType eq "American Express"}
        fa-cc-amex
    {elseif $ccType eq "JCB"}
        fa-cc-jcb
    {elseif $ccType eq "Diners Club" || $ccType eq "EnRoute"}
        fa-cc-diners-club
    {else}
        fa-credit-card
    {/if}
{/function}
<script>
    // Define state tab index value
    var statesTab = 10;
    var stateNotRequired = true;
    
    window.langPasswordStrength = "{$LANG.pwstrength}";
    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
	$(function () {
		
		$('.list-payment-method > li:first').addClass("active").find('input[type=radio]').attr("checked","checked");
		
		$('#alert-tooltip').delay(5000).hide(0);
		
		$('[data-toggle="tooltip"]').tooltip();
		
		$(".list-payment-method > li").click(function(){
			value = $(this).data('cycle');
			$(this).addClass("active").find('input[type=radio]').attr("checked","checked");
			$(this).siblings().removeClass("active").find('input[type=radio]').removeAttr("checked");
		});
		
		$('#customerAccountType a').click(function(){
			$('#inputCustType').val($(this).data('type'));
		});
		{if $cartitems != 0}
		$('.cart-next-step').click(function(){
			$(this).find('span:first').addClass('not-visible');
			$(this).find('.button-loader').removeClass('hidden');
			$('#submit-form').trigger('click');
		});{/if}
		
		$('.osagreement').click(function(){
			if ($(this).children().is('.checked')) {
				$('#accepttos').attr("checked","checked");
			} else {
				$('#accepttos').removeAttr("checked");
			}
		});
		
		$('#osagreement').on('ifChecked', function(event){
			if ( $(this).is(':checked') ) {
				$('#accepttos').attr("checked","checked");
			}
		});
		
		$(".item-qty input[type='text']").TouchSpin({
			buttondown_class: 'btn btn-default btn-outline qty-button',
            buttonup_class: 'btn btn-default btn-outline qty-button',
			buttondown_txt: '<i class="zmdi zmdi-minus"></i>',
            buttonup_txt: '<i class="zmdi zmdi-plus"></i>',
		});
		
	    $(".qty-button").click(function() {
		    $('#orderSummaryLoader').removeClass('hidden');
		    updateQTY();
		});
		
		$('.promo-code-action').click(function() {
			$(this).find('span:first').addClass('not-visible');
			$(this).find('.button-loader').removeClass('hidden');
		});
		
		function updateQTY() {
		    var post = jQuery.post("cart.php", 'ajax=1&a=view&'+jQuery("#frmSummary").serialize());
			post.done(
		        function(data) {
		            jQuery("#orderSummary").html(jQuery(data).find('#orderSummary').html());
					jQuery(".item-qty input[type='text']").TouchSpin({
						buttondown_class: 'btn btn-default btn-outline qty-button',
			            buttonup_class: 'btn btn-default btn-outline qty-button',
						buttondown_txt: '<i class="zmdi zmdi-minus"></i>',
			            buttonup_txt: '<i class="zmdi zmdi-plus"></i>',
					});
					jQuery(".qty-button").click(function() {
					    jQuery('#orderSummaryLoader').removeClass('hidden');
					    updateQTY();
					});
		        }
		    );
		}
	});
	function removeItem(type, num) {
		jQuery('#orderSummary').removeClass('hidden');
		jQuery.post('cart.php', 'a=remove&r=' + type + '&i=' + num)
	}
</script>

<!-- NAV START -->
{include file="orderforms/{$carttpl}/nav-top.tpl" step="3"}
<!-- NAV END -->

<div class="container hide">
	<div class="title-heads">
	    <h1>{$LANG.cartreviewcheckout}</h1>
	</div>
</div>

<div id="order-standard_cart" class="sidebar-right u-mt-medium">
	<div class="container" style="position: relative;">
        
        <div class="content-body">
			{if $errormessage}
                <div class="alert alert-danger alert-primary checkout-error-feedback" role="alert">
                    <p>{$LANG.orderForm.correctErrors}:</p>
                    <ul>
                        {$errormessage}
                    </ul>
                </div>
            {/if}

            {if $bundlewarnings}
                <div class="alert alert-warning alert-primary" role="alert">
                    <strong>{$LANG.bundlereqsnotmet}</strong><br />
                    <ul>
                        {foreach from=$bundlewarnings item=warning}
                            <li>{$warning}</li>
                        {/foreach}
                    </ul>
                </div>
            {/if}

            <form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" name="orderfrm" id="frmCheckout">
		    <input type="hidden" name="submit" value="true" />
		    <input type="hidden" name="custtype" id="inputCustType" value="{$custtype}" />
		    	
                {if !$loggedin}
		    	<div class="tabs tab-lg">
                    <ul class="nav nav-tabs nav-transparent" id="customerAccountType">
                        <li class="active">
                            <a href="#tab-register" data-toggle="tab" data-type="new">
	                            {$LANG.orderForm.createAccount}
	                        </a>
                        </li>
                        <li>
                            <a href="#tab-login" data-toggle="tab" data-type="existing">
	                            {$LANG.orderForm.alreadyRegistered}
	                        </a>
                        </li>
                    </ul>
                </div>
				{/if}
				<div class="tab-content tab-sm">
				    {if !$loggedin}
			        <div id="tab-login" class="tab-pane">
				        <div class="row form-labelless">
						    <div class="col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
						      <div class="form-group">
						        <div class="input-icon input-icon-left input-icon-xlg">
						          <div class="input-icon-addon">
						            <i class="zmdi zmdi-email"></i>
						          </div>
						          <input type="text" class="form-control no-custom-style input-xlg" name="loginemail" id="inputLoginEmail" placeholder="{$LANG.orderForm.emailAddress}"/>
						        </div>
						      </div>
						      <div class="form-group">
						        <div class="input-icon input-icon-left input-icon-xlg">
						          <div class="input-icon-addon">
						            <i class="zmdi zmdi-lock"></i>
						          </div>
			                        <input type="password" class="form-control no-custom-style input-xlg" name="loginpassword" id="inputLoginPassword" placeholder="{$LANG.clientareapassword}"/>
						        </div>
						      </div>
						    </div>
						</div>
			        </div>
					{/if}
			        <div id="tab-register" class="tab-pane active">
			
			            <div class="tab-section">
				            <div class="row">
				                <div class="col-sm-6 form-group">
			                        <label for="inputLastName" class="control-label">
			                            {$LANG.orderForm.lastName}
			                        </label>
			                        <input type="text" name="lastname" id="inputLastName" class="form-control no-custom-style" value="{$clientsdetails.lastname}"{if $loggedin} readonly="readonly"{/if}>
				                </div>
				                <div class="col-sm-6 form-group">
			                        <label for="inputFirstName" class="control-label">
			                            {$LANG.orderForm.firstName}
			                        </label>
			                        <input type="text" name="firstname" id="inputFirstName" class="form-control no-custom-style" value="{$clientsdetails.firstname}"{if $loggedin} readonly="readonly"{/if}>
				                </div>
				                <div class="col-sm-6 form-group">
			                        <label for="inputEmail"  class="control-label">
			                            {$LANG.orderForm.emailAddress}
			                        </label>
			                        <input type="email" name="email" id="inputEmail" class="form-control no-custom-style" value="{$clientsdetails.email}"{if $loggedin} readonly="readonly"{/if}>
				                </div>
				                <div class="col-sm-6 form-group">
			                        <label for="inputPhone" class="control-label">
			                            {$LANG.orderForm.phoneNumber}
			                        </label>
			                        <input type="tel" name="phonenumber" id="inputPhone" class="form-control no-custom-style" value="{$clientsdetails.phonenumber}"{if $loggedin} readonly="readonly"{/if}>
				                </div>
				            </div>
				            {if !$loggedin}
						        <input type="hidden" name="country" value="CN" />
						        <input type="hidden" name="state" value="{$LANG.clientareastate}" />
						        <input type="hidden" name="city" value="{$LANG.clientareacity}" />
						        <input type="hidden" name="postcode" value="" />
						        <input type="hidden" name="companyname" value="" />
						        <input type="hidden" name="address1" value="{$LANG.clientareaaddress1}" />
						        <input type="hidden" name="address2" value="{$LANG.clientareaaddress2}" />
				            {else}
		
		                    <div class="row">
		                        <div class="col-sm-6 form-group">
		                            <div class="prepend-icon">
		                                <label for="inputCompanyName" class="field-icon">
		                                    <i class="fa fa-building"></i>
		                                </label>
		                                <input type="text" name="companyname" id="inputCompanyName" class="form-control no-custom-style" placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" value="{$clientsdetails.companyname}"{if $loggedin} readonly="readonly"{/if}>
		                            </div>
		                        </div>
		                        <div class="col-sm-6 form-group">
		                            <div class="prepend-icon">
		                                <label for="inputAddress1" class="field-icon">
		                                    <i class="fa fa-building-o"></i>
		                                </label>
		                                <input type="text" name="address1" id="inputAddress1" class="form-control no-custom-style" placeholder="{$LANG.orderForm.streetAddress}" value="{$clientsdetails.address1}"{if $loggedin} readonly="readonly"{/if}>
		                            </div>
		                        </div>
		                        <div class="col-sm-6 form-group">
		                            <div class="prepend-icon">
		                                <label for="inputAddress2" class="field-icon">
		                                    <i class="fa fa-map-marker"></i>
		                                </label>
		                                <input type="text" name="address2" id="inputAddress2" class="form-control no-custom-style" placeholder="{$LANG.orderForm.streetAddress2}" value="{$clientsdetails.address2}"{if $loggedin} readonly="readonly"{/if}>
		                            </div>
		                        </div>
		                        <div class="col-sm-6 form-group">
		                            <div class="prepend-icon">
		                                <label for="inputCity" class="field-icon">
		                                    <i class="fa fa-building-o"></i>
		                                </label>
		                                <input type="text" name="city" id="inputCity" class="form-control no-custom-style" placeholder="{$LANG.orderForm.city}" value="{$clientsdetails.city}"{if $loggedin} readonly="readonly"{/if}>
		                            </div>
		                        </div>
		                        <div class="col-sm-6 form-group">
		                            <div class="prepend-icon">
		                                <label for="inputState" class="field-icon" id="inputStateIcon">
		                                    <i class="fa fa-map-signs"></i>
		                                </label>
		                                <input type="text" name="state" id="inputState" class="form-control no-custom-style" placeholder="{$LANG.orderForm.state}" value="{$clientsdetails.state}"{if $loggedin} readonly="readonly"{/if}>
		                            </div>
		                        </div>
		                        <div class="col-sm-6 form-group">
		                            <div class="prepend-icon">
		                                <label for="inputPostcode" class="field-icon">
		                                    <i class="fa fa-certificate"></i>
		                                </label>
		                                <input type="text" name="postcode" id="inputPostcode" class="form-control no-custom-style" placeholder="{$LANG.orderForm.postcode}" value="{$clientsdetails.postcode}"{if $loggedin} readonly="readonly"{/if}>
		                            </div>
		                        </div>
		                        <div class="col-sm-12 form-group">
	                                <select name="country" id="inputCountry" class="form-control no-custom-style"{if $loggedin} disabled="disabled"{/if}>
	                                    {foreach $countries as $countrycode => $countrylabel}
	                                        <option value="{$countrycode}"{if (!$country && $countrycode == $defaultcountry) || $countrycode eq $country} selected{/if}>
	                                            {$countrylabel}
	                                        </option>
	                                    {/foreach}
	                                </select>
		                        </div>
		                    </div>
				            {/if}
			            </div>
			
			            {if $customfields}
			                <div class="sub-heading">
			                    <span>{$LANG.orderadditionalrequiredinfo}</span>
			                </div>
			                <div class="field-container">
			                    <div class="row">
			                        {foreach $customfields as $customfield}
			                            <div class="col-sm-6">
			                                <div class="form-group">
			                                    <label for="customfield{$customfield.id}">{$customfield.name}</label>
			                                    {$customfield.input}
			                                    {if $customfield.description}
			                                        <span class="field-help-text">
			                                            {$customfield.description}
			                                        </span>
			                                    {/if}
			                                </div>
			                            </div>
			                        {/foreach}
			                    </div>
			                </div>
			            {/if}
				
				        {if $domainsinorder}
				
							<h2 class="h5 font-w300 push-20">{$LANG.domainregistrantinfo}</h2>
				
				            <p class="small text-muted">{$LANG.orderForm.domainAlternativeContact}</p>
				
				            <div class="row u-pv-small">
				                <div class="col-sm-6">
				                    <select name="contact" id="inputDomainContact" class="form-control no-custom-style">
				                        <option value="">{$LANG.usedefaultcontact}</option>
				                        {foreach $domaincontacts as $domcontact}
				                            <option value="{$domcontact.id}"{if $contact == $domcontact.id} selected{/if}>
				                                {$domcontact.name}
				                            </option>
				                        {/foreach}
				                        <option value="addingnew"{if $contact == "addingnew"} selected{/if}>
				                            {$LANG.clientareanavaddcontact}...
				                        </option>
				                    </select>
				                </div>
				            </div>
				
				            <div class="row{if $contact neq "addingnew"} hidden{/if}" id="domainRegistrantInputFields">
				                <div class="col-sm-6">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCFirstName"  class="field-icon">
				                            <i class="fa fa-user"></i>
				                        </label>
				                        <input type="text" name="domaincontactfirstname" id="inputDCFirstName" class="form-control no-custom-style" placeholder="{$LANG.orderForm.firstName}" value="{$domaincontact.firstname}">
				                    </div>
				                </div>
				                <div class="col-sm-6">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCLastName"  class="field-icon">
				                            <i class="fa fa-user"></i>
				                        </label>
				                        <input type="text" name="domaincontactlastname" id="inputDCLastName" class="form-control no-custom-style" placeholder="{$LANG.orderForm.lastName}" value="{$domaincontact.lastname}">
				                    </div>
				                </div>
				                <div class="col-sm-6">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCEmail"  class="field-icon">
				                            <i class="fa fa-envelope"></i>
				                        </label>
				                        <input type="email" name="domaincontactemail" id="inputDCEmail" class="form-control no-custom-style" placeholder="{$LANG.orderForm.emailAddress}" value="{$domaincontact.email}">
				                    </div>
				                </div>
				                <div class="col-sm-6">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCPhone"  class="field-icon">
				                            <i class="fa fa-phone"></i>
				                        </label>
				                        <input type="tel" name="domaincontactphonenumber" id="inputDCPhone" class="form-control no-custom-style" placeholder="{$LANG.orderForm.phoneNumber}" value="{$domaincontact.phonenumber}">
				                    </div>
				                </div>
				                <div class="col-sm-12">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCCompanyName"  class="field-icon">
				                            <i class="fa fa-building"></i>
				                        </label>
				                        <input type="text" name="domaincontactcompanyname" id="inputDCCompanyName" class="form-control no-custom-style" placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" value="{$domaincontact.companyname}">
				                    </div>
				                </div>
				                <div class="col-sm-12">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCAddress1"  class="field-icon">
				                            <i class="fa fa-building-o"></i>
				                        </label>
				                        <input type="text" name="domaincontactaddress1" id="inputDCAddress1" class="form-control no-custom-style" placeholder="{$LANG.orderForm.streetAddress}" value="{$domaincontact.address1}">
				                    </div>
				                </div>
				                <div class="col-sm-12">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCAddress2"  class="field-icon">
				                            <i class="fa fa-map-marker"></i>
				                        </label>
				                        <input type="text" name="domaincontactaddress2" id="inputDCAddress2" class="form-control no-custom-style" placeholder="{$LANG.orderForm.streetAddress2}" value="{$domaincontact.address2}">
				                    </div>
				                </div>
				                <div class="col-sm-4">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCCity"  class="field-icon">
				                            <i class="fa fa-building-o"></i>
				                        </label>
				                        <input type="text" name="domaincontactcity" id="inputDCCity" class="form-control no-custom-style" placeholder="{$LANG.orderForm.city}" value="{$domaincontact.city}">
				                    </div>
				                </div>
				                <div class="col-sm-5">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCState"  class="field-icon">
				                            <i class="fa fa-map-signs"></i>
				                        </label>
				                        <input type="text" name="domaincontactstate" id="inputDCState" class="form-control no-custom-style" placeholder="{$LANG.orderForm.state}" value="{$domaincontact.state}">
				                    </div>
				                </div>
				                <div class="col-sm-3">
				                    <div class="form-group prepend-icon">
				                        <label for="inputDCPostcode"  class="field-icon">
				                            <i class="fa fa-certificate"></i>
				                        </label>
				                        <input type="text" name="domaincontactpostcode" id="inputDCPostcode" class="form-control no-custom-style" placeholder="{$LANG.orderForm.postcode}" value="{$domaincontact.postcode}">
				                    </div>
				                </div>
				                <div class="col-sm-12">
				                    <div class="form-group prepend-icon">
				                        <select name="domaincontactcountry" id="inputDCCountry" class="form-control no-custom-style">
				                            {foreach $countries as $countrycode => $countrylabel}
				                                <option value="{$countrycode}"{if (!$domaincontact.country && $countrycode == $defaultcountry) || $countrycode eq $domaincontact.country} selected{/if}>
				                                    {$countrylabel}
				                                </option>
				                            {/foreach}
				                        </select>
				                    </div>
				                </div>
				            </div>
				
				        {/if}
				
				        {if !$loggedin}
					        <div class="tab-section">
				
				                <div class="row">
				                    <div class="col-sm-6">
				                        <div class="form-group">
				                            <label for="inputNewPassword1"  class="control-label">
				                                <i class="fa fa-lock"></i>
				                            </label>
				                            <input type="password" name="password" id="inputNewPassword1" class="form-control no-custom-style" placeholder="{$LANG.clientareapassword}">
				                        </div>
				                    </div>
				                    <div class="col-sm-6">
				                        <div class="form-group">
				                            <label for="inputNewPassword2"  class="control-label">
				                                <i class="fa fa-lock"></i>
				                            </label>
				                            <input type="password" name="password2" id="inputNewPassword2" class="form-control no-custom-style" placeholder="{$LANG.clientareaconfirmpassword}">
				                        </div>
				                    </div>
				                    <div class="col-sm-6">
				                        <div class="progress">
				                            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
				                            </div>
				                        </div>
				                    </div>
				                    <div class="col-sm-6">
				                        <p class="text-center small text-muted" id="passwordStrengthTextLabel" style="margin-bottom: 0;">{$LANG.pwstrength}: {$LANG.pwstrengthenter}</p>
				                    </div>
				                </div>
				                {if $securityquestions}
				                    <div class="row">
				                        <div class="col-sm-6">
				                            <select name="securityqid" id="inputSecurityQId" class="form-control no-custom-style">
				                                <option value="">{$LANG.clientareasecurityquestion}</option>
				                                {foreach $securityquestions as $question}
				                                    <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
				                                        {$question.question}
				                                    </option>
				                                {/foreach}
				                            </select>
				                        </div>
				                        <div class="col-sm-6">
				                            <div class="form-group prepend-icon">
				                                <label for="inputSecurityQAns"  class="control-label">
				                                    <i class="fa fa-lock"></i>
				                                </label>
				                                <input type="password" name="securityqans" id="inputSecurityQAns" class="form-control no-custom-style" placeholder="{$LANG.clientareasecurityanswer}">
				                            </div>
				                        </div>
				                    </div>
				                {/if}
				
				            </div>
				
				        {/if}
				
				        <div id="creditCardInputFields"{if $selectedgatewaytype neq "CC"} class="hidden"{/if}>
				            {if $clientsdetails.cclastfour}
				                <div class="row margin-bottom">
				                    <div class="col-sm-12">
				                        <div class="text-center">
				                            <label class="radio-inline">
				                                <input type="radio" name="ccinfo" value="useexisting" id="useexisting" {if $clientsdetails.cclastfour} checked{else} disabled{/if} />
				                                {$LANG.creditcarduseexisting}
				                                {if $clientsdetails.cclastfour}
				                                    ({$clientsdetails.cclastfour})
				                                {/if}
				                            </label>
				                            <label class="radio-inline">
				                                <input type="radio" name="ccinfo" value="new" id="new" {if !$clientsdetails.cclastfour || $ccinfo eq "new"} checked{/if} />
				                                {$LANG.creditcardenternewcard}
				                            </label>
				                        </div>
				                    </div>
				                </div>
				            {else}
				                <input type="hidden" name="ccinfo" value="new" />
				            {/if}
				            <div id="newCardInfo" class="row{if $clientsdetails.cclastfour && $ccinfo neq "new"} hidden{/if}">
				                <div class="col-sm-6">
				                    <div class="form-group">
				                        <input type="hidden" id="cctype" name="cctype" value="{$acceptedcctypes.0}" />
				                        <div class="dropdown" id="cardType">
				                            <button class="btn btn-default dropdown-toggle field" type="button" id="creditCardType" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
				                                <span id="selectedCardType">
				                                    <i class="fa {getFontAwesomeCCIcon ccType=$acceptedcctypes.0} fa-fw"></i>
				                                    {$acceptedcctypes.0}
				                                </span>
				                                <span class="fa fa-caret-down fa-fw"></span>
				                            </button>
				                            <ul class="dropdown-menu" id="creditCardTypeDropDown" aria-labelledby="creditCardType">
				                                {foreach $acceptedcctypes as $cardType}
				                                    <li>
				                                        <a href="#">
				                                            <i class="fa {getFontAwesomeCCIcon ccType=$cardType} fa-fw"></i>
				                                            <span class="type">
				                                                {$cardType}
				                                            </span>
				                                        </a>
				                                    </li>
				                                {/foreach}
				                            </ul>
				                        </div>
				                    </div>
				                </div>
				                <div class="col-sm-6">
				                    <div class="form-group prepend-icon">
				                        <label for="inputCardNumber"  class="field-icon">
				                            <i class="fa fa-credit-card"></i>
				                        </label>
				                        <input type="tel" name="ccnumber" id="inputCardNumber" class="form-control no-custom-style" placeholder="{$LANG.orderForm.cardNumber}" autocomplete="cc-number">
				                    </div>
				                </div>
				                {if $showccissuestart}
				                    <div class="col-sm-6">
				                        <div class="form-group prepend-icon">
				                            <label for="inputCardStart"  class="field-icon">
				                                <i class="fa fa-calendar-check-o"></i>
				                            </label>
				                            <input type="tel" name="ccstartdate" id="inputCardStart" class="form-control no-custom-style" placeholder="MM / YY ({$LANG.creditcardcardstart})" autocomplete="cc-exp">
				                        </div>
				                    </div>
				                    <div class="col-sm-6">
				                        <div class="form-group prepend-icon">
				                            <label for="inputCardIssue"  class="field-icon">
				                                <i class="fa fa-asterisk"></i>
				                            </label>
				                            <input type="tel" name="ccissuenum" id="inputCardIssue" class="form-control no-custom-style" placeholder="{$LANG.creditcardcardissuenum}">
				                        </div>
				                    </div>
				                {/if}
				                <div class="col-sm-6">
				                    <div class="form-group prepend-icon">
				                        <label for="inputCardExpiry"  class="field-icon">
				                            <i class="fa fa-calendar"></i>
				                        </label>
				                        <input type="tel" name="ccexpirydate" id="inputCardExpiry" class="form-control no-custom-style" placeholder="MM / YY{if $showccissuestart} ({$LANG.creditcardcardexpires}){/if}" autocomplete="cc-exp">
				                    </div>
				                </div>
				                <div class="col-sm-6">
				                    <div class="form-group prepend-icon">
				                        <label for="inputCardCVV"  class="field-icon">
				                            <i class="fa fa-barcode"></i>
				                        </label>
				                        <input type="tel" name="cccvv" id="inputCardCVV" class="form-control no-custom-style" placeholder="{$LANG.orderForm.cvv}" autocomplete="cc-cvc">
				                    </div>
				                </div>
				            </div>
				            <div id="existingCardInfo" class="row{if !$clientsdetails.cclastfour || $ccinfo eq "new"} hidden{/if}">
				                <div class="col-sm-12">
				                    <div class="form-group prepend-icon">
				                        <label for="inputCardCVC"  class="field-icon">
				                            <i class="fa fa-barcode"></i>
				                        </label>
				                        <input type="tel" name="cccvvexisting" id="inputCardCVC" class="form-control no-custom-style" placeholder="{$LANG.orderForm.cvv}" autocomplete="cc-cvc">
				                    </div>
				                </div>
				            </div>
						</div>
					</div>
				</div>
	            <!-- .blcok END -->
	            
	            {if $canUseCreditOnCheckout}
                    <div id="applyCreditContainer" class="apply-credit-container" data-apply-credit="{$applyCredit}">
			            <div class="panel panel-order">
				            <div class="panel-header">
					            <div class="header-title">
						        	<h6>{lang key='cart.availableCreditBalance' amount=$creditBalance}</h6>
					            </div>
						    </div>
							<div class="panel-body">

		                        {if $creditBalance->toNumeric() >= $total->toNumeric()}
				                    <div class="form-group u-m-zero">
			                            <label>
			                                <input id="useFullCreditOnCheckout" type="radio" name="applycredit" value="1"{if $applyCredit} checked{/if}>
			                                {lang key='cart.applyCreditAmountNoFurtherPayment' amount=$total}
			                            </label>
				                    </div>
		                        {else}
				                    <div class="form-group u-m-zero">
			                            <label>
			                                <input id="useCreditOnCheckout" type="radio" name="applycredit" value="1"{if $applyCredit} checked{/if}>
			                                {lang key='cart.applyCreditAmount' amount=$creditBalance}
			                            </label>
				                    </div>
		                        {/if}
		
				                <div class="form-group u-m-zero">
			                        <label>
			                            <input id="skipCreditOnCheckout" type="radio" name="applycredit" value="0"{if !$applyCredit} checked{/if}>
			                            {lang key='cart.applyCreditSkip' amount=$creditBalance}
			                        </label>
				                </div>
							</div>
			            </div>
                    </div>
                {/if}
                
                <div id="paymentGatewaysContainer" class="form-group">
		            <div class="panel panel-order">
			            <div class="panel-header">
				            <div class="header-title">
					        	<h6>{$LANG.orderForm.preferredPaymentMethod}</h6>
				            </div>
					    </div>
						<div class="panel-body">
			
			                {if $bundlewarnings}
			                    <div class="alert alert-warning" role="alert">
			                        <strong>{$LANG.bundlereqsnotmet}</strong><br />
			                        <ul>
			                            {foreach from=$bundlewarnings item=warning}
			                                <li>{$warning}</li>
			                            {/foreach}
			                        </ul>
			                    </div>
			                {/if}
			                
					        <ul class="list-payment-method">
				                
								{foreach $gateways as $key => $gateway}
				                <li>
				                	<a style="cursor: pointer">
				                
				                    	<input type="radio" name="paymentmethod" value="{$gateway.sysname}" class="payment-methods hide"{if $selectedgateway eq $gateway.sysname} checked{/if} id="{$gateway.sysname}" />
						                <div class="payment-method-selector-content {$gateway.sysname}">
							                <div class="icon" style="background-image: url('{$WEB_ROOT}/templates/orderforms/{$carttpl}/img/{$gateway.sysname}.svg?2')"></div>
				                            <span class="name hidden">
				                                {$gateway.name}
				                            </span>
						                </div>
				                	</a>
				                </li>
				                {/foreach}
						        {foreach $gatewaysoutput as $gatewayoutput}
				                    <div class="view-cart-gateway-checkout">
				                        {$gatewayoutput}
				                    </div>
				                {/foreach}
					        </ul>
						    
						</div>
					</div>
                </div>
	            <!-- .blcok END -->
	            
	            {if $shownotesfield}
	            <div class="panel panel-order">
		            <div class="panel-header">
			            <div class="header-title">
				        	<h6>{$LANG.orderForm.additionalNotes}</h6>
			            </div>
				    </div>
		        	<div class="panel-body">
			        	<textarea name="notes" class="form-control no-custom-style" placeholder="{$LANG.ordernotesdescription}">{$orderNotes}</textarea>
		        	</div>
	            </div>
	            {/if}
	            
				<div class="checkout-security-msg">
                    <i class="zmdi zmdi-lock"></i>
			        {$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}
                </div>
				{if $accepttos}
                <div class="hide">
                    <input type="checkbox" name="accepttos" id="accepttos" />
                </div>
	            {/if}
				<button type="submit" id="submit-form" class="hidden">Checkout</button>
        	</form>
        </div>
        
		<div class="content-sidebar" id="scrollingPanelContainer">
            
            <div class="panel panel-summary" id="orderSummary">
                <div class="panel-header">
	                <div class="header-title">
	                    <h6><i class="zmdi zmdi-shopping-cart"></i> {$LANG.ordersummary}</h6>
	                    <div class="loader hidden" id="orderSummaryLoader">
	                    	<i class="spinner"></i>
	                    </div>
	                </div>
	            </div>
	            {if $products or $domains or $addons or $renewals}
	            <div class="panel-list scroll-list ps-container ps-theme-default">
                    <form method="post" action="cart.php?a=view" id="frmSummary">
		        		<ul class="list-summary">
                        {foreach $products as $num => $product}
                            <li class="summary-item">
                            	<div class="item-row">
                                    <div class="item-name">
                                        <span class="item-title">
                                        	{if $product.productinfo.name == "Operating System"}
												{$LANG.cartoperatingsystem}
											{else if $product.productinfo.name == "Location"}
												{$LANG.cartlocation}
											{else if $product.productinfo.name == "Cores"}
												{$LANG.cartcpu}
											{else if $product.productinfo.name == "Memory"}
												{$LANG.cartmemory}
											{else if $product.productinfo.name == "Disk Space"}
												{$LANG.cartdiskspace}
											{else if $product.productinfo.name == "Bandwidth"}
												{$LANG.cartbandwidth}
											{else if $product.productinfo.name == "Extra IP Address"}
												{$LANG.cartextraipaddress}
											{else}
												{$product.productinfo.name}
											{/if}
                                        </span>
                                        {if $product.domain}
                                            <span class="item-domain">
                                                {$product.domain}
                                            </span>
                                        {/if}
                                    </div>
                                    <div class="item-price">
                                        <b>{$product.pricingtext}</b>
                                        <!-- {$product|print_r} -->
                                    </div>
                            	</div>
                            {if $product.configoptions}
                                {foreach key=confnum item=configoption from=$product.configoptions}
                                <div class="item-row">
                                	<div class="item-name">
                                    	<span class="item-title">
                                    		{if $configoption.name == "Operating System"}
												{$LANG.cartoperatingsystem}
											{else if $configoption.name == "Location"}
												{$LANG.cartlocation}
											{else if $configoption.name == "Cores"}
												{$LANG.cartcpu}
											{else if $configoption.name == "Memory"}
												{$LANG.cartmemory}
											{else if $configoption.name == "Disk Space"}
												{$LANG.cartdiskspace}
											{else if $configoption.name == "Bandwidth"}
												{$LANG.cartbandwidth}
											{else if $configoption.name == "Extra IP Address"}
												{$LANG.cartextraipaddress}
											{else}
												{$configoption.name}
											{/if}
                                    	</span>
                                	</div>
									<div class="item-price">
										<small>
                                	{if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$configoption.option}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}
										</small>
									</div>
                                </div>
                                {/foreach}
                            {/if}
                            {if $product.addons}
                                {foreach key=addonnum item=addon from=$product.addons}
                                <div class="item-row">
                                	<div class="item-name">
                                        <span class="item-domain">
                                    		{$addon.name}
                                    	</span>
                                        {if $addon.setup}
                                            <span class="item-setup">
                                                {$addon.setup} {$LANG.ordersetupfee}
                                            </span>
                                        {/if}
                                	</div>
                                    <div class="item-price">
                                        <small>{$addon.totaltoday}</small>
                                        <small class="hide">{$addon.billingcyclefriendly}</small>
                                    </div>
                                </div>
                                {/foreach}
                            {/if}
								<div class="item-row">
                                    <div class="item-qty">
	                                    
                                        {if $product.allowqty}
                                        <div class="input-group input-group-xs">
		                                    <input type="text" name="qty[{$num}]" value="{$product.qty}" class="form-control no-custom-style" />
		                                </div>
                                        {/if}
                                        
                                        <a onclick="removeItem('p','{$num}')" class="btn btn-xs btn-icon qty-button" data-toggle="tooltip" data-original-title="{$LANG.orderForm.remove}">
		                                    <i class="zmdi zmdi-delete"></i>
		                                </a>
		                                <a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}" class="btn btn-icon btn-xs" data-toggle="tooltip" data-original-title="{$LANG.orderForm.edit}">
                                            <i class="zmdi zmdi-edit"></i>
                                        </a>
                                    </div>
                                    <div class="item-license">
                                        {$product.billingcyclefriendly}
                                    </div>
                            	</div>
                            </li>
                        {/foreach}

                        {foreach $addons as $num => $addon}
                            <li class="summary-item">
                            	<div class="item-row">
                                    <div class="item-name">
                                        <span class="item-title">
                                        	{$addon.name}
                                        </span>
                                        {if $addon.domainname}
                                            <span class="item-domain">
                                                {$addon.domainname}
                                            </span>
                                        {/if}
                                        {if $addon.setup}
                                            <span class="item-setup">
                                                {$addon.setup} {$LANG.ordersetupfee}
                                            </span>
                                        {/if}
                                    </div>
                                    <div class="item-price">
                                        <b>{$addon.pricingtext}</b>
                                    </div>
                            	</div>
								<div class="item-row">
                                    <div class="item-qty">
                                        
                                        <a onclick="removeItem('a','{$num}')" class="btn btn-xs btn-icon qty-button" data-toggle="tooltip" data-original-title="{$LANG.orderForm.remove}">
		                                    <i class="zmdi zmdi-delete"></i>
		                                </a>
                                    </div>
                                    <div class="item-license">
                                        {$addon.billingcyclefriendly}
                                    </div>
                            	</div>
                            </li>
                        {/foreach}

                        {foreach $domains as $num => $domain}
                            <li class="summary-item">
                            	<div class="item-row">
                                    <div class="item-name">
                                        <span class="item-title">
                                            {if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}
                                        </span>
                                        {if $domain.domain}
                                            <span class="item-domain">
                                                {$domain.domain}
                                            </span>
                                        {/if}
                                        {if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
                                        {if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
                                        {if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
                                    </div>
                                    <div class="item-price">
                                        {if count($domain.pricing) == 1 || $domain.type == 'transfer'}
                                            <span name="{$domain.domain}Price">{$domain.price}</span>
                                            <span class="cycle">{$domain.regperiod} {$domain.yearsLanguage}</span>
                                            <span class="renewal cycle">
                                                {if isset($domain.renewprice)}{lang key='domainrenewalprice'} <span class="renewal-price cycle">{$domain.renewprice->toPrefixed()}{$domain.shortYearsLanguage}{/if}</span>
                                            </span>
                                        {else}
                                            <span name="{$domain.domain}Price">{$domain.price}</span>
                                            <div class="dropdown">
                                                <button class="btn btn-default btn-xs dropdown-toggle" type="button" id="{$domain.domain}Pricing" name="{$domain.domain}Pricing" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                    {$domain.regperiod} {$domain.yearsLanguage}
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="{$domain.domain}Pricing">
                                                    {foreach $domain.pricing as $years => $price}
                                                        <li>
                                                            <a href="#" onclick="selectDomainPeriodInCart('{$domain.domain}', '{$price.register}', {$years}, '{if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}');return false;">
                                                                {$years} {if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if} @ {$price.register}
                                                            </a>
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            </div>
                                            <span class="renewal cycle">
                                                {lang key='domainrenewalprice'} <span class="renewal-price cycle">{if isset($domain.renewprice)}{$domain.renewprice->toPrefixed()}{$domain.shortYearsLanguage}{/if}</span>
                                            </span>
                                        {/if}
                                    </div>
									<div class="item-row">
	                                    <div class="item-qty">
	                                        
	                                        <a onclick="removeItem('d','{$num}')" class="btn btn-xs btn-icon qty-button" data-toggle="tooltip" data-original-title="{$LANG.orderForm.remove}">
			                                    <i class="zmdi zmdi-delete"></i>
			                                </a>
                                            <a href="{$smarty.server.PHP_SELF}?a=confdomains" class="btn btn-icon btn-xs" data-toggle="tooltip" data-original-title="{$LANG.orderForm.edit}">
                                                <i class="zmdi zmdi-edit"></i>
                                            </a>
	                                    </div>
	                            	</div>
                            	</div>
                            </li>
                        {/foreach}

                        {foreach key=num item=domain from=$renewals}
                            <li class="summary-item">
                            	<div class="item-row">
                                    <div class="item-name">
                                        <span class="item-title">
                                            {$LANG.domainrenewal}
                                        </span>
                                        <span class="item-domain">
                                            {$domain.domain}
                                        </span>
                                        {if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
                                        {if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
                                        {if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
                                    </div>
                                    <div class="item-price">
                                        <span>{$domain.price}</span>
                                        <span class="cycle">{$domain.regperiod} {$LANG.orderyears}</span>
                                    </div>
									<div class="item-row">
	                                    <div class="item-qty">
		                                    <a onclick="removeItem('r','{$num}')" class="btn btn-xs btn-icon qty-button" data-toggle="tooltip" data-original-title="{$LANG.orderForm.remove}">
			                                    <i class="zmdi zmdi-delete"></i>
			                                </a>
	                                    </div>
                                    </div>
                                </div>
                            </li>
                        {/foreach}
		        		</ul>
                    </form>
	            </div>
	            {else}
				<div class="no-data no-data-sm">
					<div class="no-data-slogan">
		                <div class="icon-holder">
			                <i class="zmdi zmdi-shopping-cart"></i>
		                </div>
						<p>购物车是空的</p>
					</div>
				</div>
				{/if}
				{if $products}
                <div class="panel-list">
                    <ul class="list-subtotal">
	                    <li>
	                        {$LANG.ordersubtotal}
	                        <span id="subtotal">{$subtotal}</span>
	                    </li>
                        {if $promotioncode || $taxrate || $taxrate2}
                            {if $promotioncode}
                                <li class="discount">
                                    {$promotiondescription}
                                    <span id="discount">{$discount}</span>
                                </li>
                            {/if}
                            {if $taxrate}
                                <li class="clearfix">
                                    {$taxname} @ {$taxrate}%
                                    <span id="taxTotal1">{$taxtotal}</span>
                                </li>
                            {/if}
                            {if $taxrate2}
                                <li>
                                    {$taxname2} @ {$taxrate2}%
                                    <span id="taxTotal2">{$taxtotal2}</span>
                                </li>
                            {/if}
                        {/if}
                    </ul>
                </div>
                <div class="total">
	                <span>{$LANG.ordertotalduetoday}</span>
	                {$total}
	                
                    <form method="post" action="{$WEB_ROOT}/cart.php?a=view">
						<div class="input-group">
							{if $promotioncode}
                            <input type="text" name="promocode" id="inputPromotionCode" class="form-control no-custom-style" placeholder="{lang key="orderPromoCodePlaceholder"}" required="required" value="{$promotioncode}" disabled>
						    <span class="input-group-btn">
								<a href="{$smarty.server.PHP_SELF}?a=removepromo" class="btn btn-secondary promo-code-action">
	                                <span><i class="zmdi zmdi-delete" style="position: relative;top: 25%;"></i></span>
									<span class="button-loader hidden">
										<i class="spinner"></i>
									</span>
	                            </a> 
						    </span>
						    {else}
                            <input type="text" name="promocode" id="inputPromotionCode" class="form-control no-custom-style" placeholder="{lang key="orderPromoCodePlaceholder"}" required="required">
						    <span class="input-group-btn">
						    	<button class="btn btn-secondary promo-code-action" type="submit">
									<span><i class="zmdi zmdi-check"></i></span>
									<span class="button-loader hidden">
										<i class="spinner"></i>
									</span>
								</button>
						    </span>
						    {/if}
						    {if $promoerrormessage}
				                <div class="alert alert-danger alert-tooltip" id="alert-tooltip" role="alert">
				                    {$promoerrormessage}
				                </div>
				            {elseif $promotioncode && $rawdiscount eq "0.00"}
				                <div class="alert alert-info alert-tooltip" id="alert-tooltip" role="alert">
				                    {$LANG.promoappliedbutnodiscount}
				                </div>
				            {elseif $promoaddedsuccess}
				                <div class="alert alert-success alert-tooltip" id="alert-tooltip" role="alert">
				                    {$LANG.orderForm.promotionAccepted} {$promotiondescription}
				                </div>
				            {/if}
	    				</div>
	  				</form>
	            </div>
	            {/if}
            </div>
            
            <div class="form-group">
                <label class="osagreement" for="osagreement">
                    {$LANG.ordertosagreement}
                    <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
					<input type="checkbox" id="osagreement" class="fake-acceptos">
                </label>
            </div>
	
	        <a href="javascript:void(0);" class="btn btn-xlg btn-success btn-submit btn-block cart-next-step"{if $cartitems==0} disabled="disabled"{/if}>
		        <span>
		        	<span>{$LANG.completeorder}</span>
					<i class="zmdi zmdi-long-arrow-right"></i>
				</span>
				<span class="button-loader hidden">
					<i class="spinner"></i>
				</span>
            </a>
        </div>
    </div>
</div>

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
<script type="text/javascript" src="{$WEB_ROOT}/templates/orderforms/{$carttpl}/js/bootstrap-touchspin.min.js"></script>