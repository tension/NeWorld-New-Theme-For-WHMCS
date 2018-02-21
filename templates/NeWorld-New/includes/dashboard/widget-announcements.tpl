<div class="u-flex u-justify-between">
    <h5 class="u-mb-small">{$LANG.latestannouncements}</h5>
</div>

<div class="panel-cards c-card u-mb-medium{if $announcements|@count > 4} cards-carousel{/if}">
    {if $announcements}
        <ul class="cards">
            <li>
                {foreach from=$announcements key=i item=ann}
                    <a class="card-row" href="announcements.php?id={$ann['id']}">
	                    <span class="cell-title">{$ann['title']}</span>
	                    <span class="cell-cycle pull-left">
	                    	<span class="text-muted">发布日期: </span>
	                    	{$ann['date']}
	                    </span>
	                </a>
                    {if $announcements|@count != ($i+1)}
                        {if ($i+1) % 4 == 0}</li><li>{/if}
                    {/if}
                {/foreach}
            </li>
        </ul>
        <div class="cards-nav">
            {if $announcements|@count > 4}
            <button class="card-prev btn btn-link pull-left" type="button">
            	<i class="zmdi zmdi-arrow-left"></i>
            </button>
            {/if}
            <span class="card-number">
            	<b class="number-current">{if $announcements|@count > 4}4{else}{$announcements|@count}{/if}</b>/<span class="number-total">{$announcements|@count}</span>
            </span>
            {if $announcements|@count > 4}
            <button class="card-next btn btn-link pull-right" type="button">
            	<i class="zmdi zmdi-arrow-right"></i>
            </button>{/if}
        </div>
    {else}
        <div class="no-data u-flex u-justify-center u-align-items-center">
            <div class="no-data-slogan">
                <div class="icon-holder">
                    <i class="icon icon-products"></i>
                    <div class="circle">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>
                <span>还没有任何公告</span>
            </div>
        </div>
    {/if}
</div>