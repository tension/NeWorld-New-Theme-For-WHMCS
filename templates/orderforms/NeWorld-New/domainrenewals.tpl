{include file="orderforms/$carttpl/common.tpl"}
<!-- NAV START -->
{include file="orderforms/$carttpl/nav-top.tpl" step="1"}
<!-- NAV END -->
<div id="order-standard_cart" class="main-content container">

	<div class="row u-mv-large">
        <div class="col-12 col-sm-9">
            <h1>
                {$LANG.registerdomain}
            </h1>
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
    
	<div class="row u-mb-large">
	
	    <div class="col-md-10 col-md-offset-1">
	
	        <p class="u-mb-small">{$LANG.domainrenewdesc}</p>
	
	        <form method="post" action="cart.php?a=add&renewals=true">
	
	            <table class="table table-hover table-striped renewals">
	                <thead>
	                    <tr>
	                        <th width="20"></th>
	                        <th>{$LANG.orderdomain}</th>
	                        <th class="text-center">{$LANG.domainstatus}</th>
	                        <th class="text-center">{$LANG.domaindaysuntilexpiry}</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    {foreach from=$renewals item=renewal}
	                        <tr>
	                            <td>
	                                {if !$renewal.pastgraceperiod && !$renewal.beforerenewlimit}
	                                    <input type="checkbox" name="renewalids[]" value="{$renewal.id}" />
	                                {/if}
	                            </td>
	                            <td>
	                                {$renewal.domain}
	                            </td>
	                            <td class="text-center">
	                                {$renewal.status}
	                            </td>
	                            <td class="text-center">
	                                {if $renewal.daysuntilexpiry > 30}
	                                    <span class="text-success">
	                                        {$renewal.daysuntilexpiry} {$LANG.domainrenewalsdays}
	                                    </span>
	                                {elseif $renewal.daysuntilexpiry > 0}
	                                    <span class="text-danger">
	                                        {$renewal.daysuntilexpiry} {$LANG.domainrenewalsdays}
	                                    </span>
	                                {else}
	                                    <span>
	                                        {$renewal.daysuntilexpiry*-1} {$LANG.domainrenewalsdaysago}
	                                    </span>
	                                {/if}
	                                {if $renewal.ingraceperiod}
	                                    <br />
	                                    <span class="text-danger">
	                                        {$LANG.domainrenewalsingraceperiod}
	                                    </span>
	                                {/if}
	                            </td>
	                            <td>
	                                {if $renewal.beforerenewlimit}
	                                    <span class="text-danger">
	                                        {$LANG.domainrenewalsbeforerenewlimit|sprintf2:$renewal.beforerenewlimitdays}
	                                    </span>
	                                {elseif $renewal.pastgraceperiod}
	                                    <span class="text-danger">
	                                        {$LANG.domainrenewalspastgraceperiod}
	                                    </span>
	                                {else}
	                                    <select class="form-control" name="renewalperiod[{$renewal.id}]">
	                                        {foreach from=$renewal.renewaloptions item=renewaloption}
	                                            <option value="{$renewaloption.period}">
	                                                {$renewaloption.period} {$LANG.orderyears} @ {$renewaloption.price}
	                                            </option>
	                                        {/foreach}
	                                    </select>
	                                {/if}
	                            </td>
	                        </tr>
	                    {foreachelse}
	                        <tr class="carttablerow">
	                            <td colspan="5">{$LANG.domainrenewalsnoneavailable}</td>
	                        </tr>
	                    {/foreach}
	                </tbody>
	            </table>
	
	            <p class="text-center">
	                <button type="submit" class="btn btn-success">
	                    <i class="fa fa-shopping-cart"></i>
	                    {$LANG.ordernowbutton}
	                </button>
	            </p>
	
	        </form>
	
	    </div>
	</div>
</div>