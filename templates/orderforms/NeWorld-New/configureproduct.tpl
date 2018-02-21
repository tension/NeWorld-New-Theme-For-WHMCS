{include file="orderforms/{$carttpl}/common.tpl"}

<script>
var _localLang = {
    'addToCart': '{$LANG.orderForm.addToCart|escape}',
    'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
}
jQuery(function () {
	
	jQuery('.order-list > div').click(function(){
		cycle = jQuery(this).data('cycle');
		jQuery(this).addClass('selected');
		jQuery(this).siblings().removeClass('selected');
		jQuery('#inputBillingcycle').val(cycle);
		jQuery('#orderSummaryLoader').removeClass('hidden');
		recalctotals();
	});
	
	jQuery('.product-configurable-options .bk-group-detail .row > div').click(function(){
		value = jQuery(this).data('value');
		jQuery(this).addClass('selected');
		jQuery(this).siblings().removeClass('selected');
		jQuery(this).parent().find('input').val(value);
		jQuery('#orderSummaryLoader').removeClass('hidden');
		recalctotals();
	});
	
    jQuery('input[name=hostname]').val('NeWorld-'+(new Date()).getFullYear()+((new Date()).getMonth()+1).toString()+(new Date()).getDate()+parseInt(Math.random()*(999+1),10));
    
	jQuery('.systemmore').click(function(){
		jQuery('.system').slideDown(20000, function(){
			jQuery('.system').css('height', 'auto');
		});
		jQuery(this).hide();
	});
});
</script>

<!-- NAV START -->
{include file="orderforms/{$carttpl}/nav-top.tpl" step="2"}
<!-- NAV END -->

<div class="container hide">	
	<div class="title-heads">
	    <h1>{$LANG.orderconfigure}</h1>
		<p class="lead">{$LANG.orderForm.configureDesiredOptions}</p>
	</div>
</div>

<div id="order-standard_cart" class="sidebar-right u-mv-medium">

    <form id="frmConfigureProduct">
    <input type="hidden" name="configure" value="true" />
    <input type="hidden" name="i" value="{$i}" />
	<div class="container" style="position: relative;">

            
        <div class="content-body1">
            
            <div class="alert alert-danger hidden" role="alert" id="containerProductValidationErrors">
                <p>{$LANG.orderForm.correctErrors}:</p>
                <ul id="containerProductValidationErrorsList"></ul>
            </div>
            
            <div class="panel panel-order">
	            <div class="panel-header">
	                <div class="header-title">
	                    <h6>{$LANG.orderconfigure} {$productinfo.name}</h6>
	                    <!-- {$productinfo.description} -->
	                </div>
	            </div>
	            <div class="panel-body">
		        	{if $pricing.type eq "recurring"}
	                    <div class="field-container u-mb-zero">
		                    <h4 class="line">{$LANG.cartchoosecycle}</h4>
                            <dl class="bk-group group{$configoption.id}">
                                <dt class="bk-group-title">
									<span><i class="bk-group-title-icon zmdi zmdi-balance-wallet"></i>{$LANG.cartchoosecycle}</span>
								</dt>
		                        <dd class="bk-group-detail">
									<input type="hidden" id="inputBillingcycle" name="billingcycle" value="{$billingcycle}" />
	                                <div class="row order-list">
	                                {if $pricing.monthly}
	                                    <div data-cycle="monthly" data-billing="{$pricing.monthly}" class="col-6 col-sm-3 {if $billingcycle eq "monthly"}selected{/if}">
	                                        <div class="panel panel-default">
	                                        	<div class="panel-body text-center">
	                                            	<span>{$LANG.orderpaymenttermmonthly}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                {/if}
	                                {if $pricing.quarterly}
	                                    <div data-cycle="quarterly" data-billing="{$pricing.quarterly}" class="col-6 col-sm-3 {if $billingcycle eq "quarterly"}selected{/if}">
	                                        <div class="panel panel-default">
	                                        	<div class="panel-body text-center">
	                                            	<span>{$LANG.orderpaymenttermquarterly}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                {/if}
	                                {if $pricing.semiannually}
	                                    <div data-cycle="semiannually" data-billing="{$pricing.semiannually}" class="col-6 col-sm-3 {if $billingcycle eq "semiannually"}selected{/if}">
	                                        <div class="panel panel-default">
	                                        	<div class="panel-body text-center">
	                                            	<span>{$LANG.orderpaymenttermsemiannually}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                {/if}
	                                {if $pricing.annually}
	                                    <div data-cycle="annually" data-billing="{$pricing.annually}" class="col-6 col-sm-3 {if $billingcycle eq "annually"}selected{/if}">
	                                        <div class="panel panel-default">
	                                        	<div class="panel-body text-center">
	                                            	<i class="bk-button-icon"></i>
	                                            	<span>{$LANG.orderpaymenttermannually}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                {/if}
	                                {if $pricing.biennially}
	                                    <div data-cycle="biennially" data-billing="{$pricing.biennially}" class="col-6 col-sm-3 {if $billingcycle eq "biennially"}selected{/if}">
	                                        <div class="panel panel-default">
	                                        	<div class="panel-body text-center">
	                                            	<i class="bk-button-icon"></i>
	                                            	<span>{$LANG.orderpaymenttermbiennially}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                {/if}
	                                {if $pricing.triennially}
	                                    <div data-cycle="triennially" data-billing="{$pricing.triennially}" class="col-6 col-sm-3 {if $billingcycle eq "triennially"}selected{/if}">
	                                        <div class="panel panel-default">
	                                        	<div class="panel-body text-center">
	                                            	<i class="bk-button-icon"></i>
	                                            	<span>{$LANG.orderpaymenttermtriennially}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                {/if}
	                                </div>
	                            </dd>
                            </dl>
	                    </div>
	                {/if}
	
	                {if $configurableoptions}
	                    <h4 class="line">{$LANG.orderconfigpackage}</h4>
						
	                    <div class="product-configurable-options" id="productConfigurableOptions">
	                    {foreach $configurableoptions as $num => $configoption}
	                        <div class="row">
                                {if $configoption.optiontype eq 1}
								<div class="col-sm-12">
                                    <dl class="bk-group group{$configoption.id}">
                                        <dt class="bk-group-title">
											<span>
											{if $configoption.optionname == "Operating System"}
												<i class="bk-group-title-icon zmdi zmdi-layers"></i>{$LANG.cartoperatingsystem}
											{else if $configoption.optionname == "Location"}
												<i class="bk-group-title-icon zmdi zmdi-pin"></i>{$LANG.cartlocation}
											{else if $configoption.optionname == "Cores"}
												<i class="bk-group-title-icon zmdi zmdi-blur-circular"></i>{$LANG.cartcpu}
											{else if $configoption.optionname == "Memory"}
												<i class="bk-group-title-icon zmdi zmdi-memory"></i>{$LANG.cartmemory}
											{else if $configoption.optionname == "Disk Space"}
												<i class="bk-group-title-icon zmdi zmdi-storage"></i>{$LANG.cartdiskspace}
											{else if $configoption.optionname == "Bandwidth"}
												<i class="bk-group-title-icon zmdi zmdi-cloud"></i>{$LANG.cartbandwidth}
											{else if $configoption.optionname == "Extra IP Address"}
												<i class="bk-group-title-icon zmdi zmdi-gps-dot"></i>{$LANG.cartextraipaddress}
											{else}
												<i class="bk-group-title-icon zmdi zmdi-widgets"></i>{$configoption.optionname}
											{/if}
											</span>
										</dt>
                                        <dd class="bk-group-detail">
                                        	<div class="row">
				                                <div class="col-12 col-sm-6">
				                                    <div class="form-group">
				                                        <select name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" class="form-control no-custom-style">
				                                            {foreach key=num2 item=options from=$configoption.options}
				                                                <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>
				                                                    {$options.name}
				                                                </option>
				                                            {/foreach}
				                                        </select>
				                                    </div>
				                                </div>
                                        	</div>
                                        </dd>
                                    </dl>
								</div>
                                {elseif $configoption.optiontype eq 2}
								<div class="col-sm-12">
                                    <dl class="bk-group group{$configoption.id}">
                                        <dt class="bk-group-title">
											<span>
											{if $configoption.optionname == "Operating System"}
												<i class="bk-group-title-icon zmdi zmdi-layers"></i>{$LANG.cartoperatingsystem}
											{else if $configoption.optionname == "Location"}
												<i class="bk-group-title-icon zmdi zmdi-pin"></i>{$LANG.cartlocation}
											{else if $configoption.optionname == "Cores"}
												<i class="bk-group-title-icon zmdi zmdi-blur-circular"></i>{$LANG.cartcpu}
											{else if $configoption.optionname == "Memory"}
												<i class="bk-group-title-icon zmdi zmdi-memory"></i>{$LANG.cartmemory}
											{else if $configoption.optionname == "Disk Space"}
												<i class="bk-group-title-icon zmdi zmdi-storage"></i>{$LANG.cartdiskspace}
											{else if $configoption.optionname == "Bandwidth"}
												<i class="bk-group-title-icon zmdi zmdi-cloud"></i>{$LANG.cartbandwidth}
											{else if $configoption.optionname == "Extra IP Address"}
												<i class="bk-group-title-icon zmdi zmdi-gps-dot"></i>{$LANG.cartextraipaddress}
											{else}
												<i class="bk-group-title-icon zmdi zmdi-widgets"></i>{$configoption.optionname}
											{/if}
											</span>
										</dt>
                                        <dd class="bk-group-detail">
	                                        <div class="{if $configoption.optionname == 'Operating System'}system{elseif $configoption.optionname == 'Location'}location{else}radio{/if}">
	                                            <div class="row">
                                                  	<input type="hidden" id="configoption-{$configoption.id}" name="configoption[{$configoption.id}]" value="{$configoption.selectedvalue}" />
	                                                {foreach key=num2 item=options from=$configoption.options}
	                                                <div class="col-6 col-sm-3{if $configoption.selectedvalue eq $options.id} selected{/if}" data-value="{$options.id}">
	                                                    <div class="panel panel-default">
	                                                        <div class="panel-body text-center">
	                                                        {if $options.name}
	                                                        	{if $configoption.optionname == 'Operating System'}
						                                        	{assign var=value value=" "|explode:$options.name}
				                                                	<i class="os-icon os-icon-lg os-{$value[0]|lower}"></i>
	                                                            	<span>{$options.name}</span>
				                                                {else if $configoption.optionname == 'Location'}
						                                        	{assign var=value value=" "|explode:$options.name}
				                                                	<i class="flag-icon flag-icon-{$value[1]|lower}"></i>
	                                                            	<span>{$value[0]}</span>
				                                                {else}
						                                        	{assign var=value value=" "|explode:$options.name}
						                                        	<span data-type="{$value[1]}">{$value[0]}</span>
				                                                {/if}
	                                                        {else}
	                                                            {$LANG.enable}
	                                                        {/if}
	                                                        </div>
	                                                    </div>
	                                                </div>
{*
						                        {if $options@iteration % 4 == 0}
						                            </div><!-- END -->
						                            <div class="row">
						                        {/if}
*}
	                                                {/foreach}
	                                            </div>
	                                        </div>
	                                        {if $configoption.optionname == 'Operating System'}
												{if $configoption.options|count > 4}
													<div class="systemmore">
														<span data-toggle="tooltip" data-placement="bottom" title="{$LANG.more}{$LANG.cartoperatingsystem}">{$LANG.more}{$LANG.cartoperatingsystem}</span>
													</div>
												{/if}
											{/if}
                                        </dd>
                                    </dl>
                                </div>
                                {elseif $configoption.optiontype eq 3}
                                <div class="col-sm-12">
                                    <div class="form-group field-container">
                                        <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
                                        <input type="checkbox" name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" value="1"{if $configoption.selectedqty} checked{/if} />
                                        <span class="bk-form-row-li-info bk-ml2">
                                        {if $configoption.options.0.name}
                                            {$configoption.options.0.name}
                                        {else}
                                            {$LANG.enable}
                                        {/if}
                                        </span>
                                    </div>
                                </div>
                                {elseif $configoption.optiontype eq 4}
                                <div class="col-sm-12" style="margin-bottom: 20px;">
                                    <dl class="bk-group group{$configoption.id}">
                                        <dt class="bk-group-title">
											<span>
											{if $configoption.optionname == "Operating System"}
												<i class="bk-group-title-icon zmdi zmdi-layers"></i>{$LANG.cartoperatingsystem}
											{else if $configoption.optionname == "Location"}
												<i class="bk-group-title-icon zmdi zmdi-pin"></i>{$LANG.cartlocation}
											{else if $configoption.optionname == "Cores"}
												<i class="bk-group-title-icon zmdi zmdi-blur-circular"></i>{$LANG.cartcpu}
											{else if $configoption.optionname == "Memory"}
												<i class="bk-group-title-icon zmdi zmdi-memory"></i>{$LANG.cartmemory}
											{else if $configoption.optionname == "Disk Space"}
												<i class="bk-group-title-icon zmdi zmdi-storage"></i>{$LANG.cartdiskspace}
											{else if $configoption.optionname == "Bandwidth"}
												<i class="bk-group-title-icon zmdi zmdi-cloud"></i>{$LANG.cartbandwidth}
											{else if $configoption.optionname == "Extra IP Address"}
												<i class="bk-group-title-icon zmdi zmdi-gps-dot"></i>{$LANG.cartextraipaddress}
											{else}
												<i class="bk-group-title-icon zmdi zmdi-widgets"></i>{$configoption.optionname}
											{/if}
											</span>
										</dt>
                                        <dd class="bk-group-detail">
                                        <div class="row">
                                            <div class="col-sm-12">
	                                        {if $configoption.qtymaximum}
	                                            <div class="u-mb-medium u-pr-small">
		                                            {if !$rangesliderincluded}
		                                                <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
		                                                <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
		                                                <link href="{$BASE_PATH_CSS}/ion.rangeSlider.skinFlat.css" rel="stylesheet">
		                                                {assign var='rangesliderincluded' value=true}
		                                            {/if}
		                                            <input type="text" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" class="form-control js-rangeslider" />
		                                            <script>
		                                                var sliderTimeoutId = null;
		                                                var sliderRangeDifference = {$configoption.qtymaximum} - {$configoption.qtyminimum};
		                                                // The largest size that looks nice on most screens.
		                                                var sliderStepThreshold = 25;
		                                                // Check if there are too many to display individually.
		                                                var setLargerMarkers = sliderRangeDifference > sliderStepThreshold;
		
		                                                jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
		                                                    min: {$configoption.qtyminimum},
		                                                    max: {$configoption.qtymaximum},
		                                                    grid: true,
		                                                    grid_snap: setLargerMarkers ? false : true,
		                                                    {if $configoption.optionname == 'Bandwidth'}
		                                                    	postfix: ' GB',
		                                                    {/if}
		                                                    onChange: function() {
		                                                        if (sliderTimeoutId) {
		                                                            clearTimeout(sliderTimeoutId);
		                                                        }
		
		                                                        sliderTimeoutId = setTimeout(function() {
		                                                            sliderTimeoutId = null;
		                                                            recalctotals();
		                                                        }, 250);
		                                                    }
		                                                });
		                                            </script>
	                                            </div>
	                                        {else}
	                                            <div class="u-mb-medium">
	                                                <input type="number" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" min="{$configoption.qtyminimum}" onchange="recalctotals()" onkeyup="recalctotals()" class="form-control no-custom-style form-control-qty" />
	                                                <span class="form-control-static form-control-static-inline">
	                                                    x {$configoption.options.0.name}
	                                                </span>
	                                            </div>
	                                        {/if}
                                            </div>
                                        </div>
                                        </dd>
                                    </dl>
                                </div>
                                {/if}
	                        </div>
	                        {/foreach}
	                    </div>
	
	                {/if}

                    {if $productinfo.type eq "server"}
                        <dl class="bk-group">
                            <dt class="bk-group-title">
								<span><i class="bk-group-title-icon zmdi zmdi-settings"></i>{$LANG.cartconfigserver}</span>
							</dt>
                            <dd class="bk-group-detail">
	                            <div class="row">
	                                <div class="col-sm-12">
	                                    <div class="bk-form-row">
	                                        <label for="inputRootpw" class="bk-form-row-name">{$LANG.orderserverrootpassword|upper}</label>
	                                        <div class="bk-form-row-cell">
	                                        	<input type="password" name="rootpw" class="bk-form-input form-control no-custom-style" id="inputRootpw" value="{$server.rootpw}">
	                                        	<span class="bk-form-row-li-info bk-ml2" ng-if="tip" ng-bind="tip">8 - 30 个字符，且同时包含三项（大写字母，小写字母，数字和特殊符号） </span>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-12">
	                                    <div class="bk-form-row">
	                                        <label for="inputHostname" class="bk-form-row-name">{$LANG.orderserverhostname}</label>
	                                        <div class="bk-form-row-cell">
	                                        	<input type="text" name="hostname" class="bk-form-input form-control no-custom-style" id="inputHostname" value="{$server.hostname}" placeholder="如不填写，系统默认自动生成">
	                                        	<span class="bk-form-row-li-info bk-ml2">长度为2-128个字符，以大小写字母或中文开头，可包含数字，"."，"_"或"-"</span>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="row hide">
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <label for="inputNs1prefix">{$LANG.serverns1prefix}</label>
	                                        <input type="text" name="ns1prefix" class="form-control no-custom-style" id="inputNs1prefix" value="{if $server.ns1prefix}{$server.ns1prefix}{else}8.8.8.8{/if}" placeholder="ns1">
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <label for="inputNs2prefix">{$LANG.serverns2prefix}</label>
	                                        <input type="text" name="ns2prefix" class="form-control no-custom-style" id="inputNs2prefix" value="{if $server.ns2prefix}{$server.ns2prefix}{else}8.8.4.4{/if}" placeholder="ns2">
	                                    </div>
	                                </div>
	                            </div>
                            </dd>
                        </dl>
                    {/if}
	
	                {if $customfields}
                        <dl class="bk-group">
                            <dt class="bk-group-title">
								<span><i class="bk-group-title-icon zmdi zmdi-badge-check"></i>{$LANG.orderadditionalrequiredinfo}</span>
							</dt>
                            <dd class="bk-group-detail">
                            	<div class="row">
		                        {foreach $customfields as $customfield}
		                            <div class="form-group {if $customfield.type == 'dropdown'}col-12 col-sm-6{else}col-12{/if}">
		                                <label for="customfield{$customfield.id}">{$customfield.name}</label>
		                                {if $customfield.type == 'tickbox'}
		                                	{assign var="input" value=$customfield.input}
		                                	{$input}
		                                {else}
		                                	{$customfield.input|replace:'form-control':'form-control no-custom-style'}
		                                {/if}
		                                {if $customfield.description}
                                        	<span class="bk-form-row-li-info bk-ml2">
		                                        {$customfield.description}
		                                    </span>
		                                {/if}
		                            </div>
		                        {/foreach}
                            	</div>
                            </dd>
                        </dl>
	                {/if}
	
	                {if $addons}
                        <dl class="bk-group" style="border-bottom: 0;">
                            <dt class="bk-group-title">
								<span><i class="bk-group-title-icon zmdi zmdi-collection-plus"></i>{$LANG.cartavailableaddons}</span>
							</dt>
                            <dd class="bk-group-detail">
			                    <div class="row addon-products">
			                        {foreach $addons as $addon}
			                            <div class="col-12 col-sm-6">
			                                <div class="panel panel-default panel-addon{if $addon.status} panel-addon-selected{/if}">
			                                    <div class="panel-body">
				                                    <input type="checkbox" name="addons[{$addon.id}]"{if $addon.status} checked{/if} />
			                                        <h5>
			                                            {$addon.name}
			                                            <small>{$addon.pricing}</small>
			                                        </h5>
			                                        {$addon.description}
			                                    </div>
			                                    <div class="panel-add">
			                                        <i class="fa fa-plus"></i>
			                                        {$LANG.addtocart}
			                                    </div>
			                                </div>
			                            </div>
			                        {/foreach}
			                    </div>
                            </dd>
                        </dl>
	                {/if}
	            </div>
            </div>
	        <div id="scrollingPanelContainer">
	
	            <div class="panel panel-summary panel-configur" id="orderSummary">
		            <div class="container" style="position: relative;">
		                <div class="panel-header hide">
			                <div class="header-title">
			                    <h6 style="text-align: left;padding-left: 40px;"><i class="zmdi zmdi-shopping-cart"></i> {$LANG.ordersummary}</h6>
			                </div>
			            </div>
			            <div id="producttotal">
			                <div class="panel-body" style="position: relative;height: 100px;">
				                <i class="spinner"></i>
				            </div>
			            </div>
					    <div class="hidden" id="orderSummaryLoader" style="position: absolute;top: 61px;left: 50%;margin-left: -20px;">
					    	<i class="spinner"></i>
					    </div>
			            <div id="cart-next-step" class="text-center col-sm-3">
			                <button type="submit" id="btnCompleteProductConfig" class="btn btn-xlg btn-success btn-submit btn-block cart-next-step">
						        <span>
						        	<span>{$LANG.continue}</span>
									<i class="zmdi zmdi-long-arrow-right"></i>
								</span>
								<span class="button-loader hidden">
									<i class="spinner"></i>
								</span>
			                </button>
			            </div>
		            </div>
	            </div>
	
	        </div>
            
            <div class="alert alert-warning info-text-sm">
                <i class="fa fa-question-circle"></i>
                {$LANG.orderForm.haveQuestionsContact} <a href="contact.php" target="_blank" class="alert-link">{$LANG.orderForm.haveQuestionsClickHere}</a>
            </div>

        </div>
	</div>

    </form>
</div>

<script>recalctotals();</script>
