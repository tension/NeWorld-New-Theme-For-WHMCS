{include file="orderforms/$carttpl/common.tpl"}
<!-- NAV START -->
{include file="orderforms/$carttpl/nav-top.tpl" step="1"}
<!-- NAV END -->
<div id="order-standard_cart" class="main-content container">

	<div class="row u-mv-large">
        <div class="col-12 col-sm-9">
            <h1>
                {$LANG.cartproductaddons}
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
	
    {if count($addons) == 0}
        <div class="alert alert-warning text-center" role="alert">
            {$LANG.cartproductaddonsnone}
        </div>
        <p class="text-center">
            <a href="clientarea.php" class="btn btn-default">
                <i class="fa fa-arrow-circle-left"></i>
                {$LANG.orderForm.returnToClientArea}
            </a>
        </p>
    {/if}

    <div class="products u-mb-large">
        <div class="row row-eq-height">
            {foreach $addons as $num => $addon}
                <div class="col-md-6">
                    <div class="panel panel-default" id="product{$num}">
                        <div class="panel-body">
                            <form method="post" action="{$smarty.server.PHP_SELF}?a=add" class="form-inline">
                                <input type="hidden" name="aid" value="{$addon.id}" />
                                <h4>
                                    <span>{$addon.name}</span>
                                    {if $product.qty}
                                        <span class="qty">
                                            {$product.qty} {$LANG.orderavailable}
                                        </span>
                                    {/if}
                                </h4>
                                <div class="product-desc">
                                    <p>{$addon.description}</p>
                                    <div style="margin: 20px 0;">
                                        <select name="productid" id="inputProductId{$num}" class="form-control select2">
                                            {foreach $addon.productids as $product}
                                                <option value="{$product.id}">
                                                    {$product.product}{if $product.domain} - {$product.domain}{/if}
                                                </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                <div class="push-50-t clearfix">
                                	<div class="product-pricing pull-left">
                                        {if $addon.free}
                                            {$LANG.orderfree}
                                        {else}
                                            <span class="price">{$addon.recurringamount} {$addon.billingcycle}</span>
                                            {if $addon.setupfee}<br />+ {$addon.setupfee} {$LANG.ordersetupfee}{/if}
                                        {/if}
                                    </div>
                                    <button type="submit" class="btn btn-success btn-sm pull-right">
                                        <i class="fa fa-shopping-cart"></i>
                                        {$LANG.ordernowbutton}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                {if $num % 2 != 0}
                    </div>
                    <div class="row row-eq-height">
                {/if}
            {/foreach}
        </div>
    </div>
</div>
