{include file="orderforms/$carttpl/common.tpl"}
<!-- NAV START -->
{include file="orderforms/$carttpl/nav-top.tpl" step="1"}
<!-- NAV END -->

<div id="order-standard_cart" class="main-content container">

	<div class="row u-mv-large">
        <div class="col-12 col-sm-9">
            <h1>
                {if $productGroup.headline}
                    {$productGroup.headline}
                {else}
                    {$productGroup.name}
                {/if}
            </h1>
	        {if $productGroup.tagline}
	            <p>{$productGroup.tagline}</p>
	        {/if}
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
    
    {foreach $hookAboveProductsOutput as $output}
        <div>
            {$output}
        </div>
    {/foreach}
	
    {if $errormessage}
    <div class="alert alert-danger u-mt-medium">
        {$errormessage}
    </div>
    {/if}

    <div class="products" id="products">
	    
	    {if $uiManager['cartmode'] == 'dark'}
		<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/webhost.css?1" />
        <div class="row">
            {foreach $products as $product}
	            <div class="col-xs-12 {if $products|@count > 3}col-sm-3{else}col-sm-4{/if}">
                    <div class="product webhost clearfix" id="product{$product.pid}">
                        <h4 class="text-center">
                            <span id="product{$product@iteration}-name" class="title">{$product.name}</span>
                            <div class="product-pricing" id="product{$product.pid}-price">
                                {if $product.bid}
                                    {$LANG.bundledeal}
                                    {if $product.displayprice}
                                        <span class="price">
                                        	<span class="moeny">{$product.displayprice}</span>
                                        	<span class="user-balance-small"></span>
                                        	<span class="user-small suffix">元</span>
                                        </span>
                                    {/if}
                                {else}
                                    {if $product.pricing.hasconfigoptions}
                                        <small>{$LANG.startingfrom}</small>
                                    {/if}
                                        <span class="price">
                                        {if $product.pricing.minprice.price !="0.00元"}
                                        	{$product.pricing.minprice.price}
                                        {else}
                                        	Free
                                        {/if}
                                        </span>
                                    <span class="cycle">
                                        {if $product.pricing.minprice.cycle eq "monthly"}
                                            {$LANG.orderpaymenttermmonthly}
                                        {elseif $product.pricing.minprice.cycle eq "quarterly"}
                                            {$LANG.orderpaymenttermquarterly}
                                        {elseif $product.pricing.minprice.cycle eq "semiannually"}
                                            {$LANG.orderpaymenttermsemiannually}
                                        {elseif $product.pricing.minprice.cycle eq "annually"}
                                            {$LANG.orderpaymenttermannually}
                                        {elseif $product.pricing.minprice.cycle eq "biennially"}
                                            {$LANG.orderpaymenttermbiennially}
                                        {elseif $product.pricing.minprice.cycle eq "triennially"}
                                            {$LANG.orderpaymenttermtriennially}
                                        {/if}
                                    </span>
                                {/if}
                            </div>
                        </h4>
                        <div class="product-desc">
                            {if $product.featuresdesc}
                                <div id="product{$product@iteration}-description">
                                    {$product.featuresdesc}
                                </div>
                            {/if}
                            {if $product.features}
                            <ul>
                                {foreach $product.features as $feature => $value}
                                    <li id="product{$product@iteration}-feature{$value@iteration}">
                                        <span class="feature-value">{$value}</span>
                                        {$feature}
                                    </li>
                                {/foreach}
                            </ul>
                            {/if}
                        </div>
                        <div class="product-btm">
                            <a href="{$WEB_ROOT}/cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn btn-success btn-block" id="product{$product@iteration}-order-button">
                                <i class="fa fa-shopping-cart"></i>
                                {$LANG.ordernowbutton}
                                {if $product.qty}
                                    <span class="qty">
                                        {$product.qty} {$LANG.orderavailable}
                                    </span>
                                {/if}
                            </a>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
	    {else}
	    <div class="row" {*id="product{$product.pid}"*}>
			{foreach $products as $product}
		    <div class="col-md-3">
		        <article class="c-plan u-bg-white">
		            
		            <h5 class="c-plan__title" id="product{$product@iteration}-name">{$product.name}</h5>
					
		            <h4 class="c-plan__price">
			            {if $product.bid}
		                    {$LANG.bundledeal}
		                    {if $product.displayprice}
		                        <span class="price">
		                        	<span class="moeny">{$product.displayprice}</span>
		                        	<span class="user-balance-small"></span>
		                        	<span class="user-small suffix">元</span>
		                        </span>
		                    {/if}
		                {else}
		                    {if $product.pricing.minprice.price !="0.00元"}
		                    	{$product.pricing.minprice.price}
		                    {else}
		                    	Free
		                    {/if}
		                    <span class="u-text-mute u-h6">
		                        {if $product.pricing.minprice.cycle eq "monthly"}
		                            /{$LANG.orderpaymenttermmonthly}
		                        {elseif $product.pricing.minprice.cycle eq "quarterly"}
		                            /{$LANG.orderpaymenttermquarterly}
		                        {elseif $product.pricing.minprice.cycle eq "semiannually"}
		                            /{$LANG.orderpaymenttermsemiannually}
		                        {elseif $product.pricing.minprice.cycle eq "annually"}
		                            /{$LANG.orderpaymenttermannually}
		                        {elseif $product.pricing.minprice.cycle eq "biennially"}
		                            /{$LANG.orderpaymenttermbiennially}
		                        {elseif $product.pricing.minprice.cycle eq "triennially"}
		                            /{$LANG.orderpaymenttermtriennially}
		                        {/if}
		                    </span>
		                {/if}
		            </h4>
		
		            {if $product.pricing.hasconfigoptions}
		            <h5 class="c-plan__note">{$LANG.startingfrom}</h5>
		            {/if}
		
		            <span class="c-plan__divider"></span>
		
		            {if $product.featuresdesc}
		                <ul id="product{$product@iteration}-description">
		                    {$product.featuresdesc}
		                </ul>
		            {/if}
		            {if $product.features}
		            <ul>
		                {foreach $product.features as $feature => $value}
		                    <li id="product{$product@iteration}-feature{$value@iteration}">
		                        <span class="feature-value">{$value}</span>
		                        {$feature}
		                    </li>
		                {/foreach}
		            </ul>
		            {/if}
		
		            <a href="{$WEB_ROOT}/cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="c-btn c-btn--info u-mt-small btn-block" id="product{$product@iteration}-order-button">
			        	{$LANG.ordernowbutton}
		                {if $product.qty}
		                    <span class="qty">
		                        {$product.qty} {$LANG.orderavailable}
		                    </span>
		                {/if}
		            </a>
		        </article><!-- // .c-plan -->
		    </div>
		    {/foreach}
		</div>
		{/if}
    </div>

	{foreach $hookBelowProductsOutput as $output}
	<div>
	    {$output}
	</div>
	{/foreach}
</div>