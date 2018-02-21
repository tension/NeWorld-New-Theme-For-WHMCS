{include file="$template/header.tpl"}

{if $status eq "Unpaid"}
	{assign var="label" value="danger"}
{elseif $status eq "Paid"}
	{assign var="label" value="success"}
{elseif $status eq "Refunded"}
	{assign var="label" value="refunded"}
{elseif $status eq "Cancelled"}
	{assign var="label" value="default"}
{elseif $status eq "Collections"}
	{assign var="label" value="collections"}  
{elseif $status eq "Draft"}
	{assign var="label" value="draft"}  
{/if}
<style>
.PayIMG {
	max-height: 100% !important;
	max-width: 100% !important;
	padding: 0 !important;
}
.Paytext {
	padding: 5px 0;
    font-size: 12px;
    border-radius: 2px;
    margin-top: 10px;
    color: #FFF;
    background-color: #10A1E5;
}
</style>
<div class="row invoice-container u-mb-medium">

	{if $status == "Unpaid" || $manualapplycredit}
	<div class="col-lg-9">
	{else}
	<div class="col-lg-10 col-sm-offset-1">
	{/if}
		<div class="c-card u-mb-medium">
			<div class="c-card__head">
                <h5 class="c-card__title">{$pagetitle}</h5>
            </div>
            <div class="u-p-medium">
				{if $invalidInvoiceIdRequested}
				
				    {include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoiceserror bodyTextCenter=true}
				
				{else}
		            <div class="invoice-top row">
		                <div class="col-sm-6">
		
		                    {if $logo}
		                        <p><img src="{$logo}" title="{$companyname}" /></p>
		                    {else}
		                        <h2>{$companyname}</h2>
		                    {/if}
		
		                </div>
		                <div class="col-sm-6 text-right-sm">
			                <ul class="list-unstyled">
								<li>
									<div class="list-label">{$LANG.invoicesdatecreated}:</div>
									<strong>{$date}</strong>
								</li>
		                    {if $status eq "Unpaid" || $status eq "Draft"}
								<li>
									<div class="list-label">{$LANG.invoicesdatedue}:</div>
									<strong>{$datedue}</strong>
								</li>
		                    {/if}
							{if $status eq "Paid"}
								<li>
									<div class="list-label">Paid:</div>
									<strong>{$paymentmethod}, {$datepaid}</strong>
								</li>
							{/if}
							</ul>
		                </div>
		            </div>
					<div class="invoice-status status-lg label-{$label}">
						<div class="row">
							<div class="status-id col-sm-8 col-xs-6"> #{$invoicenum} </div>
							<div class="status-label col-sm-4 col-xs-6"> 
								{if $status eq "Unpaid"}
									{$LANG.invoicesunpaid}
								{elseif $status eq "Paid"}
									{$LANG.invoicespaid}
								{elseif $status eq "Refunded"}
									{$LANG.invoicesrefunded}
								{elseif $status eq "Cancelled"}
									{$LANG.invoicescancelled}
								{elseif $status eq "Collections"}
									{$LANG.invoicescollections}
								{elseif $status eq "Draft"}
									草稿
								{/if}
							</div>
						</div>
					</div>
			
		            {if $paymentSuccess}
		                {include file="$template/includes/panel.tpl" type="success" headerTitle=$LANG.success bodyContent=$LANG.invoicepaymentsuccessconfirmation bodyTextCenter=true}
		            {elseif $pendingReview}
		                {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$LANG.invoicepaymentpendingreview bodyTextCenter=true}
		            {elseif $paymentFailed}
		                {include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoicepaymentfailedconfirmation bodyTextCenter=true}
		            {elseif $offlineReview}
		                {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$LANG.invoiceofflinepaid bodyTextCenter=true}
		            {/if}
		
					<div class="invoice-info row">
						<div class="invoice-payto col-sm-8">
							<h5>{$LANG.invoicespayto}:</h5>
							<address>
								{$payto}
							</address>
						</div>
						<div class="invoice-invoicedto col-sm-4">
							<h5>{$LANG.invoicesinvoicedto}:</h5>
							<ul class="list-unstyled list-address">
								{if $clientsdetails.companyname}
								<li><b class="color-blue">{$clientsdetails.companyname}</b></li>
								{/if}
							
								<li>{$clientsdetails.firstname} {$clientsdetails.lastname}</li>
								<li>{$clientsdetails.address1}, {$clientsdetails.address2}</li>
								<li>{$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}</li>
								<li>{$clientsdetails.country}</li>
								{if $customfields}                                    
									{foreach from=$customfields item=customfield}
									<li>{$customfield.fieldname}: {$customfield.value}</li>
									{/foreach}
								{/if}
							</ul>
						</div>
					</div>
		
		            {if $notes}
		                {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.invoicesnotes bodyContent=$notes}
		            {/if}
		            
	                <div class="invoice-table">
			        	<table class="table table-solid">
				            <colgroup>
				            	<col width="70%" />
								<col width="30%" />
				            </colgroup>
				            <thead>
				            	<tr>
				                	<th>{$LANG.invoicesdescription}</th>
									<th>{$LANG.invoicesamount}</th>
				            	</tr>
				            </thead>
                            <tbody>
                                {foreach from=$invoiceitems item=item}
                                    <tr>
                                        <td><b>{$item.description}</b>{if $item.taxed eq "true"} *{/if}</td>
                                        <td class="amount-col value-discounted"><b>{$item.amount}</b></td>
                                    </tr>
                                {/foreach}
                            </tbody>
				            <tfoot class="table-summary">
				                <tr>
				                	<td class="cell-label">{$LANG.invoicessubtotal}</td>
				                	<td class="cell-value">{$subtotal}</td>
				                </tr>
								<tr>
				                	<td class="cell-label">{$LANG.invoicescredit}</td>
									<td class="cell-value">{$credit}</td>
				              	</tr>
							  	{if $taxrate}
								<tr>
									<td class="cell-label">{$taxrate}% {$taxname}:</td>
									<td class="cell-value">{$tax}</td>
								</tr>
								{/if}
								{if $taxrate2}
								<tr>
									<td class="cell-label">{$taxrate2}% {$taxname2}:</td>
									<td class="cell-value">{$tax2}</td>
								</tr>
								{/if}
				            </tfoot>
                        </table>
	                </div>
					<div class="invoice-status status-md label-{$label}">
						<div class="row">
							<div class="status-id col-sm-8 col-xs-6">{$LANG.invoicestotal}</div>
							<div class="status-label col-sm-4 col-xs-6"> {$total} </div>
						</div>
					</div>
		
		            {if $taxrate}
		                <p>* {$LANG.invoicestaxindicator}</p>
		            {/if}
		
		            <div class="transactions-container small-text">
		                <div class="invoice-table">
							<table class="table table-solid">
					            <colgroup >
						            <col width="20%"/>
						            <col width="20%"/>
						            <col width="40%"/>
						            <col width="20%"/>
					            </colgroup>
		                        <thead>
		                            <tr>
		                                <th>{$LANG.invoicestransdate}</th>
		                                <th>{$LANG.invoicestransgateway}</th>
		                                <th>{$LANG.invoicestransid}</th>
		                                <th>{$LANG.invoicestransamount}</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            {foreach from=$transactions item=transaction}
		                                <tr>
											<td class="amount-col">{$transaction.date}</td>
											<td class="date-col">{$transaction.gateway}</td>
											<td class="amount-col">{$transaction.transid}</td>
											<td class="date-col">{$transaction.amount}</td>
		                                </tr>
		                            {foreachelse}
		                                <tr>
		                                    <td class="text-center" colspan="4">{$LANG.invoicestransnonefound}</td>
		                                </tr>
		                            {/foreach}
		                        </tbody>
					            <tfoot class="table-summary">
					            	<tr>
					                	<td colspan="3" class="cell-label">{$LANG.invoicesbalance}</td>
										<td class="cell-value">{$balance}</td>
					            	</tr>
					            </tfoot>
		                    </table>
		                </div>
		            </div>
				{/if}
            </div>
		</div>
	</div>
	{if $status == "Unpaid" || $manualapplycredit}
	<div class="col-lg-3 invoice-sidebar">
		<div class="c-card u-mb-medium">
			<div class="c-card__head">
                <h5 class="c-card__title">{$LANG.paymentmethod}</h5>
            </div>
            <div class="u-p-small">
				{if $status eq "Unpaid" && $allowchangegateway}
					<div class="preloader hidden">
						<div class="spinner"></div>
	          		</div>
			  		<div class="form-group">
			  			<form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
			  				{$gatewaydropdown|replace:'<select':'<select class="form-control"'}
	            		</form>
	          		</div>
			    {else}
			        <div class="form-group">
				        {$paymentmethod|replace:'<select':'<select class="form-control"'}
				    </div>
			    {/if}
			    
	    		<div class="form-actions text-center">
		    		{$paymentbutton|replace:'<input type="submit"':'<input type="submit" class="btn btn-primary btn-block mt-8" style="white-space: normal"'}{*'*}
		    	</div>
            </div>
		</div>
		{if $manualapplycredit}
		<div class="c-card u-mb-medium">
			<div class="c-card__head">
                <h5 class="c-card__title">{$LANG.invoiceaddcreditapply}</h5>
            </div>
            <div class="u-p-small">
				<div class="preloader hidden">
					<div class="spinner"></div>
				</div>
				<form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
					<div class="alert alert-info alert-sm">{$LANG.invoiceaddcreditdesc1} <b>{$totalcredit}.</b> {$LANG.invoiceaddcreditdesc2}</div>
					<input type="hidden" name="applycredit" value="true" />
					<div class="form-group">
						<label class="control-label">{$LANG.invoiceaddcreditamount}:</label>
						<input class="form-control" type="text" name="creditamount" value="{$creditamount}"/>
					</div>
					<input type="submit" class="btn btn-block btn-primary" value="{$LANG.invoiceaddcreditapply}" />
				</form>
            </div>
		</div>
		{/if}
	</div>
	{/if}
</div>
