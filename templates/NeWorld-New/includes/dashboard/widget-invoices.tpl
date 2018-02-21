<div class="u-flex u-justify-between">
    <h5 class="u-mb-small">{$LANG.clientHomePanels.overdueInvoices}</h5>
	{if $condlinks.masspay}
	<a href="clientarea.php?action=invoices" class="c-btn c-btn--xs c-btn--secondary">
		{$LANG.masspayall}
	</a>
	{/if}
</div>

<div class="panel-cards c-card u-mb-medium{if $invoices|@count > 4} cards-carousel{/if}">
	{if $invoices}
	<ul class="cards">
		<li>
		{foreach from=$invoices item=invoice key=i}
		<a class="card-row" href="viewinvoice.php?id={$invoice.id}">
			<span class="cell-title">#{$invoice.invoicenum}</span>
			<span class="cell-date pull-left"><span class="text-muted">{$LANG.nextdue}: </span>{$invoice.datedue}</span>
			<span class="cell-total"><span class="price text-danger">{$invoice.total}</span></span>
		</a>
		{if $invoices|@count != ($i+1)}
			{if ($i+1) % 4 == 0}</li><li>{/if}
		{/if}
		{/foreach}
	</ul>
    <div class="cards-nav">
        {if $invoices|@count > 4}
        <button class="card-prev btn btn-link pull-left" type="button">
        	<i class="zmdi zmdi-arrow-left"></i>
        </button>
        {/if}
        <span class="card-number">
        	<b class="number-current">{if $invoices|@count > 4}4{else}{$invoices|@count}{/if}</b>/<span class="number-total">{$invoices|@count}</span>
        </span>
        {if $invoices|@count > 4}
        <button class="card-next btn btn-link pull-right" type="button">
        	<i class="zmdi zmdi-arrow-right"></i>
        </button>{/if}
    </div>
	{else}
	<div class="no-data u-flex u-justify-center u-align-items-center">
		<div class="no-data-slogan">
			<div class="icon-holder">
				<i class="zmdi zmdi-file"></i>
				<div class="circle">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			<span>你还没有任何账单</span>
		</div>
	</div>
	{/if}
</div>
