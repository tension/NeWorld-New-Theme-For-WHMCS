{if $emailVerificationIdValid}
    <div class="email-verification success">
        <div class="container">
            <span class="text">{$LANG.emailAddressVerified}</span>
        </div>
    </div>
{elseif $emailVerificationIdValid === false}
    <div class="email-verification failed">
        <div class="container">
            <div class="row">
                <div class="col-xs-2 col-xs-push-10 col-sm-1 col-sm-push-11">
                    <button type="button" class="btn close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="col-xs-10 col-xs-pull-2 col-sm-7 col-sm-pull-1 col-md-8">
                    <span class="text">{$LANG.emailKeyExpired}</span>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3 col-sm-pull-1">
                    <button id="btnResendVerificationEmail" class="btn btn-sm btn-block">
                    {$LANG.resendEmail}
                </button>
                </div>
            </div>
        </div>
    </div>
{elseif $emailVerificationPending && !$showingLoginPage}
	{if $templatefile eq "homepage" or $inShoppingCart or $frontend eq "0"}
	<section id="notification" data-dismissible="true" data-title="" data-expires="">
		<div class="container">
			<p>
				{$LANG.verifyEmailAddress}
				<a class="text-margin-left" id="btnResendVerificationEmail">
					{$LANG.resendEmail} <i class="fa fa-angle-right icon-right"></i>
				</a>
			</p>
		</div>
	</section>
	{else}
    <div class="email-verification">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <span class="text">{$LANG.verifyEmailAddress}</span>
                </div>
                <div class="col-md-3 col-11">
                    <button id="btnResendVerificationEmail" class="btn btn-sm btn-block">
	                    {$LANG.resendEmail}
	                </button>
                </div>
                <div class="col-md-1 col-1">
                    <button type="button" class="btn close">
                    	<span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
	{/if}
{/if}
