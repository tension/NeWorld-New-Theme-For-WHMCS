{if $inactive}

    {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.affiliatesdisabled textcenter=true}

{else}
<div class="u-p-medium">
	{if $withdrawrequestsent}
		<div class="alert alert-success">
			 <i class="zmdi zmdi-check-circle"></i>
			 {$LANG.affiliateswithdrawalrequestsuccessful}
		</div>
	{/if}
    <div class="row">
	    <div class="col-12 col-sm-6">
		    
		    <div class="c-card affiliates">
				<div class="c-graph-card__content">
					<h3 class="c-graph-card__title">{$LANG.affiliatescommissionsavailable}</h3>
					<p class="c-graph-card__number">{$balance}</p>
					<span class="c-divider u-mv-small u-opacity-medium"></span>
					<div class="row u-mb-medium">
	                    <div class="col-6 u-border-right">
	                        <div class="c-overview-card__section">
	                            <p class="u-text-mute u-nospace">{$LANG.affiliatescommissionspending}</p>
	                            <h3 class="u-nospace">{$pendingcommissions}</h3>
	                        </div>
	                    </div>
	
	                    <div class="col-6">
	                        <div class="c-overview-card__section">
	                            <p class="u-text-mute u-nospace">{$LANG.affiliateswithdrawn}</p>
	                            <h3 class="u-nospace">{$withdrawn}</h3>
	                        </div>
	                    </div>
	                </div>
				</div>
		    </div>
	    </div>
		
	    <div class="col-12 col-sm-6">
		    <div class="c-card affiliates">
				<div class="c-graph-card__content">
					<h3 class="c-graph-card__title">{$LANG.affiliatesclicks}</h3>
					<p class="c-graph-card__number">{$visitors} {if $withdrawlevel}<a class="u-mt-xsmall pull-right btn btn-success btn-sm" href="{$smarty.server.PHP_SELF}?action=withdrawrequest"><span>{$LANG.affiliatesrequestwithdrawal}</span></a>{/if}</p>
					<span class="c-divider u-mv-small u-opacity-medium"></span>
					<div class="row u-mb-medium">
	                    <div class="col-6 u-border-right">
	                        <div class="c-overview-card__section">
	                            <p class="u-text-mute u-nospace">{$LANG.affiliatessignups}</p>
	                            <h3 class="u-nospace">{$signups}</h3>
	                        </div>
	                    </div>
	
	                    <div class="col-6">
	                        <div class="c-overview-card__section">
	                            <p class="u-text-mute u-nospace">{$LANG.affiliatesconversionrate}</p>
	                            <h3 class="u-nospace">{$conversionrate}%</h3>
	                        </div>
	                    </div>
	                </div>
				</div>
		    </div>
	    </div>
	    
	    <div class="col-12 u-mt-medium">
		    <div class="c-card affiliates">
				<div class="c-graph-card__content u-pb-medium">
					<div class="row">
						<div class="col-12 col-sm-6">
							<h3 class="c-graph-card__title u-mb-small">{$LANG.affiliatesreferallink}</h3>
							<p class="u-text-mute u-h6 u-text-normal">{$LANG.featuresp6}</p>
						</div>
						<div class="col-12 col-sm-6">
							<div class="input-group input-copy u-mt-xsmall">
		                        <input class="form-control" value="{$referrallink}" type="text" id="copy_link" readonly />
		                        <span class="input-group-btn">
		                            <button class="btn btn-default" type="button" data-clipboard-target="#copy_link">
		                            	<span>{$LANG.copy}</span>
										<div class="check-animate hidden"></div>
		                            </button>
		                        </span>
		                    </div>
						</div>
					</div>
				</div>
		    </div>
	    </div>

    </div>

</div>

    {if $affiliatelinkscode}
    <div class="u-p-medium">
        <h3 class="h4">{$LANG.affiliateslinktous}</h3>
        <div class="margin-bottom text-center">
            {$affiliatelinkscode}
        </div>
    </div>
    {/if}

    {include file="$template/includes/tablelist.tpl" tableName="AffiliatesList"}
    
    <script type="text/javascript">
        jQuery(document).ready( function ()
        {
            var table = jQuery('#tableAffiliatesList').removeClass('hidden').DataTable();
            {if $orderby == 'regdate'}
                table.order(0, '{$sort}');
            {elseif $orderby == 'product'}
                table.order(1, '{$sort}');
            {elseif $orderby == 'amount'}
                table.order(2, '{$sort}');
            {elseif $orderby == 'status'}
                table.order(4, '{$sort}');
            {/if}
            table.draw();
            jQuery('#tableLoading').addClass('hidden');
        });
    </script>
    <div class="table-container clearfix">
        <table id="tableAffiliatesList" class="table table-list hidden">
            <thead>
                <tr>
                    <th>{$LANG.orderproduct}</th>
                    <th class="hidden-xs">{$LANG.affiliatesamount}</th>
                    <th>{$LANG.affiliatescommission}</th>
                    <th class="hidden-xs">{$LANG.affiliatessignupdate}</th>
                    <th>{$LANG.affiliatesstatus}</th>
                </tr>
            </thead>
            <tbody>
            {foreach from=$referrals item=referral}
            	{if $referral.amountnum}
                <tr>
                    <td>{$referral.service}</td>
                    <td data-order="{$referral.amountnum}" class="text-center hidden-xs">{$referral.amountdesc}</td>
                    <td data-order="{$referral.commissionnum}" class="text-center">{$referral.commission}</td>
                    <td class="text-center hidden-xs"><span class="hidden">{$referral.datets}</span>{$referral.date}</td>
                    <td class="text-center">
	                    <i class="fa fa-circle-o u-color-{$referral.rawstatus|strtolower} u-mr-xsmall"></i>
	                    {$referral.status}
	                </td>
                </tr>
                {/if}
            {/foreach}
            </tbody>
        </table>
        <div class="text-center" id="tableLoading">
            <p><i class="fa fa-spinner fa-spin"></i> {$LANG.loading}</p>
        </div>
    </div>

{/if}
