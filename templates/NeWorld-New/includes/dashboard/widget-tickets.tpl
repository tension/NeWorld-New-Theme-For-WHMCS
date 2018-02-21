<div class="u-flex u-justify-between">
    <h5 class="u-mb-small">{$LANG.clientHomePanels.recentSupportTickets}</h5>
</div>

<div class="panel-cards c-card u-mb-medium{if $tickets|@count > 4} cards-carousel{/if}">
{if $tickets}
	<ul class="cards">
		<li>
		{foreach from=$tickets item=ticket key=i}
			<a class="card-row" href="viewticket.php?tid={$ticket.tid}&c={$ticket.c}">
				<span class="cell-title">{if $ticket.unread}<strong>{/if}<b>#{$ticket.tid}</b> - {$ticket.subject}{if $ticket.unread}</strong>{/if}</span>
				<span class="cell-status"><span class="c-badge c-badge--secondary c-badge--{$ticket.statusClass}">{$ticket.status|strip_tags:false}</span></span>
				<span class="cell-date"><span class="text-muted">更新时间: </span>{$ticket.lastreply}</td>
			</a>
		{if $tickets|@count != ($i+1)}
		{if ($i+1) % 4 == 0}</li><li>{/if}
		{/if}
		{/foreach}
	</ul>
    <div class="cards-nav">
        {if $tickets|@count > 4}
        <button class="card-prev btn btn-link pull-left" type="button">
        	<i class="zmdi zmdi-arrow-left"></i>
        </button>
        {/if}
        <span class="card-number">
        	<b class="number-current">{if $tickets|@count > 4}4{else}{$tickets|@count}{/if}</b>/<span class="number-total">{$tickets|@count}</span>
        </span>
        {if $tickets|@count > 4}
        <button class="card-next btn btn-link pull-right" type="button">
        	<i class="zmdi zmdi-arrow-right"></i>
        </button>{/if}
    </div>
{else}
	<div class="no-data u-flex u-justify-center u-align-items-center">
		<div class="no-data-slogan">
			<div class="icon-holder">
				<i class="fa fa-envelope-o"></i>
				<div class="circle">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			<span>还没有任何激活的工单!</span>
		</div>
	</div>
{/if}
</div>
