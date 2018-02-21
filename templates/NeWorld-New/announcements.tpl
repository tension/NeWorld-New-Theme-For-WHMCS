<div class="u-p-medium">

	{if $announcementsFbRecommend}
	    <script>
	        (function(d, s, id) {
	            var js, fjs = d.getElementsByTagName(s)[0];
	            if (d.getElementById(id)) {
	                return;
	            }
	            js = d.createElement(s); js.id = id;
	            js.src = "//connect.facebook.net/{$LANG.locale}/all.js#xfbml=1";
	            fjs.parentNode.insertBefore(js, fjs);
	        }(document, 'script', 'facebook-jssdk'));
	    </script>
	{/if}
	{foreach from=$announcements item=announcement}
	
	    <div class="announcement-single">
	
	        <h3 class="c-project-card__title u-mb-xsmall">
		        <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">
		            {$announcement.title}
		        </a>
	        </h3>
	
	        <div class="article-items u-mb-small">
	            <i class="fa fa-calendar"></i> {"Y-m-d H:i"|date:$announcement.timestamp}
	        </div>
	
	        {if $announcement.text|strip_tags|strlen < 350}
	            <div class="u-text-mute u-mb-small">{$announcement.text}</div>
	        {else}
	            <div class="u-text-mute u-mb-small">{$announcement.summary}</div>
	            <p><a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="btn btn-default btn-xs">{$LANG.readmore} &raquo;</a></p>
	        {/if}
	
	
	        {if $announcementsFbRecommend}
	            <div class="fb-like hidden-sm hidden-xs" data-layout="standard" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
	            <div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
	        {/if}
	
	    </div>
	
	{foreachelse}
	
	    {include file="$template/includes/alert.tpl" type="info" msg="{$LANG.noannouncements}" textcenter=true}
	
	{/foreach}
	
	{if $prevpage || $nextpage}
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">
	        <form class="form-inline" role="form">
				<nav class="c-pagination u-justify-between">
		            
	                <a class="c-pagination__control" href="{if $prevpage}{routePath('announcement-index-paged', $prevpage, $view)}{else}#{/if}">
	                    <i class="fa fa-caret-left"></i>
	                </a>
		            
	                <p class="c-pagination__counter">{$LANG.page} {$pagenumber}</p>
	
		            
	                <a class="c-pagination__control" href="{if $nextpage}{routePath('announcement-index-paged', $nextpage, $view)}{else}#{/if}">
	                    <i class="fa fa-caret-right"></i>
	                </a>
		            
	            </nav>
	        </form>
	    </div>
	</div>
	{/if}
</div>