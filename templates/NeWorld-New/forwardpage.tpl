<div class="u-p-medium">
	<div class="row">
	    <div class="col-md-6 col-md-offset-3">
	        <div class="panel-complete u-p-medium">
	            <div class="panel-body text-center">
	                <div class="icon-holder u-mb-medium">
	                    <i class="spinner"></i>
	                </div>
	                <p class="lead">{$message}</p>
	            </div>
	        </div>
	    </div>
	</div>
</div>

<div id="frmPayment" class="hidden" align="center">
    {if $smarty.session.paypal_payment_type}
        <input type="hidden" id="paypal_payment_type" value="{$smarty.session.paypal_payment_type}">
    {/if}
    {$code}
    <form method="post" action="{if $invoiceid}viewinvoice.php?id={$invoiceid}{else}clientarea.php{/if}">
    </form>	
	<script language="javascript">
	    setTimeout("autoSubmitFormByContainer('frmPayment')", 5000);
	</script>
	
</div>

