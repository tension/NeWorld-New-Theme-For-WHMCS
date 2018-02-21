{include file="orderforms/$carttpl/common.tpl"}
<!-- NAV START -->
{include file="orderforms/$carttpl/nav-top.tpl" step="1"}
<!-- NAV END -->
<div id="order-standard_cart" class="main-content container">

	<div class="row u-mv-large">
        <div class="col-12 col-sm-9">
            <h1>
                {lang key='orderForm.transferToUs'}
            </h1>
            <p>{lang key='orderForm.transferExtend'}*</p>
        </div>

		<!--Categories START-->
        <div class="col-12 col-sm-3">
			<form method="get" action="{$smarty.server.PHP_SELF}" class="u-pt-small">
	            <select name="gid" onchange="submit()" class="form-control no-custom-style">
                    {foreach key=num item=productgroup from=$productgroups}
                        <option value="{$productgroup.gid}"{if $gid eq $productgroup.gid} selected="selected"{/if}>{$productgroup.name}</option>
                    {/foreach}
                    {if $loggedin}
                        <option value="addons"{if $gid eq "addons"} selected{/if}>{$LANG.cartproductaddons}</option>
                        {if $renewalsenabled}
                            <option value="renewals"{if $gid eq "renewals"} selected{/if}>{$LANG.domainrenewals}</option>
                        {/if}
                    {/if}
                    {if $registerdomainenabled}
                        <option value="registerdomain"{if $domain eq "register"} selected{/if}>{$LANG.navregisterdomain}</option>
                    {/if}
                    {if $transferdomainenabled}
                        <option value="transferdomain"{if $domain eq "transfer"} selected{/if}>{$LANG.transferinadomain}</option>
                    {/if}
                    <option value="viewcart"{if $action eq "view"} selected{/if}>{$LANG.viewcart}</option>
	            </select>
	        </form>
        </div>
		<!--Categories END-->
    </div>
    <div class="row u-mv-large">

        <div class="col-md-12">

            <form method="post" action="cart.php" id="frmDomainTransfer">
                <input type="hidden" name="a" value="addDomainTransfer">

                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">{lang key='orderForm.singleTransfer'}</h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="inputTransferDomain">{lang key='domainname'}</label>
                                    <input type="text" class="form-control" name="domain" id="inputTransferDomain" value="{$lookupTerm}" placeholder="{lang key='yourdomainplaceholder'}.{lang key='yourtldplaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                                </div>
                                <div class="form-group">
                                    <label for="inputAuthCode" style="width:100%;">
                                        {lang key='orderForm.authCode'}
                                        <a href="" data-toggle="tooltip" data-placement="left" title="{lang key='orderForm.authCodeTooltip'}" class="pull-right"><i class="fa fa-question-circle"></i> {lang key='orderForm.help'}</a>
                                    </label>
                                    <input type="text" class="form-control" name="epp" id="inputAuthCode" placeholder="{lang key='orderForm.authCodePlaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                </div>
                                <div id="transferUnavailable" class="alert alert-warning slim-alert text-center hidden"></div>
                                {if $captcha}
                                    <div class="captcha-container" id="captchaContainer">
                                        {if $captcha eq "recaptcha"}
                                            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                                            <div id="google-recaptcha" class="g-recaptcha recaptcha-transfer center-block" data-sitekey="{$reCaptchaPublicKey}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.required'}" ></div>
                                        {else}
                                            <div class="default-captcha">
                                                <p>{lang key="cartSimpleCaptcha"}</p>
                                                <div>
                                                    <img id="inputCaptchaImage" src="includes/verifyimage.php" />
                                                    <input id="inputCaptcha" type="text" name="code" maxlength="5" class="form-control input-sm no-custom-style" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                                </div>
                                            </div>
                                        {/if}
                                    </div>
                                {/if}
                            </div>
                            <div class="panel-footer text-right">
                                <button type="submit" id="btnTransferDomain" class="btn btn-primary btn-transfer">
                                    <span class="loader hidden" id="addTransferLoader">
                                        <i class="fa fa-fw fa-spinner fa-spin"></i>
                                    </span>
                                    <span id="addToCart">{lang key="orderForm.addToCart"}</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </form>

            <p class="text-center small">* {lang key='orderForm.extendExclusions'}</p>

        </div>
    </div>
</div>