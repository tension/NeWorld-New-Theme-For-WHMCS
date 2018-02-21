<div class="u-flex u-justify-between">
    <h5 class="u-mb-small">{$LANG.clientHomePanels.activeProductsServices}</h5>
</div>

<div class="panel-cards panel-products c-card u-mb-medium{if $NWProducts|@count > 4} cards-carousel{/if}">
    {if $NWProducts}
        <ul class="cards">
            <li>
                {foreach from=$NWProducts key=i item=prod}
                    <a class="card-row" href="clientarea.php?action=productdetails&id={$prod.id}">
                        <span class="cell-title">{$prod.name}</span>
                        <span class="cell-cycle">
                        	<span class="text-muted"></span>
                        	{$prod.domain}
                        </span>
                        {if $prod.nextduedate != '0000-00-00'}
                        <span class="cell-license">
                        	<span class="text-muted">到期: </span>
                        	{$prod.nextduedate}
                        </span>
                        {/if}
                    </a>
                    {if $NWProducts|@count != ($i+1)}
                        {if ($i+1) % 4 == 0}</li><li>{/if}
                    {/if}
                {/foreach}
            </li>
        </ul>
        <div class="cards-nav">
            {if $NWProducts|@count > 4}
            <button class="card-prev btn btn-link pull-left" type="button">
            	<i class="zmdi zmdi-arrow-left"></i>
            </button>
            {/if}
            <span class="card-number">
            	<b class="number-current">{if $NWProducts|@count > 4}4{else}{$NWProducts|@count}{/if}</b>/<span class="number-total">{$NWProducts|@count}</span>
            </span>
            {if $NWProducts|@count > 4}
            <button class="card-next btn btn-link pull-right" type="button">
            	<i class="zmdi zmdi-arrow-right"></i>
            </button>{/if}
        </div>
    {else}
        <div class="no-data u-flex u-justify-center u-align-items-center">
            <div class="no-data-slogan">
                <div class="icon-holder">
                    <i class="zmdi zmdi-shopping-cart"></i>
                    <div class="circle">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>
                <span>你还没有激活的产品。</span>
            </div>
        </div>
    {/if}
</div>