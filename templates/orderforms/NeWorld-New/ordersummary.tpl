
<div class="total col-sm-3">
    <span>{$LANG.ordertotalduetoday}</span>
    {$producttotals.pricing.totaltoday}
	<i class="hide">|</i>
    <small class="billingcycle"></small>
</div>

<div class="panel-list col-sm-5" style="padding: 21px 24px 24px">
	<ul class="confproduct-list list-unstyled row">
		<li class="hide">
			<div class="item-row">
		        <div class="item-name">
		            {$producttotals.productinfo.name}
		        </div>
		        <div class="item-price hide">
		            <b>{$producttotals.pricing.baseprice}</b>
		        </div>
			</div>
		</li>
		
		{foreach $producttotals.configoptions as $configoption}
		    {if $configoption}
			<li class="summary-item col-12 col-sm-6">
				<div class="item-row">
			        <div class="item-name">
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
			        </div>
		            <div class="item-domain">
			            {if $configoption.name == "Location"}
			            	{assign var=value value=" "|explode:$configoption.optionname}
			            	{$value[0]}
			            {else if $configoption.name == "Bandwidth"}
			            	{$configoption.optionname} GB
			            {else}
		            		{$configoption.optionname}
		            	{/if}
		            </div>
			        <div class="item-price hide">
			            <b>{$configoption.recurring}
			            {if $configoption.setup} + {$configoption.setup} {$LANG.ordersetupfee}{/if}</b>
			        </div>
				</div>
			</li>
		    {/if}
		{/foreach}
		
		{foreach $producttotals.addons as $addon}
			<li class="summary-item col-12 col-sm-6">
			<div class="item-row">
		        <div class="item-name">
		            {$LANG.cartavailableaddons}
		        </div>
		        <div class="item-domain">
		            {$addon.name}
		        </div>
		        <div class="item-price hide">
		            <b>{$addon.recurring}</b>
		        </div>
			</div>
		</li>
		{/foreach}
	</ul>
</div>

{if $producttotals.pricing.setup || $producttotals.pricing.recurring || $producttotals.pricing.addons}
<div class="panel-list hide">
    <ul class="list-subtotal">
        {if $producttotals.pricing.setup}
            <li class="hide">
                {$LANG.cartsetupfees}
                <span>{$producttotals.pricing.setup}</span>
            </li>
        {/if}
        {foreach from=$producttotals.pricing.recurringexcltax key=cycle item=recurring}
            <li>
                {$cycle}
                <span>{$recurring}</span>
            </li>
        {/foreach}
    </ul>
</div>
{/if}