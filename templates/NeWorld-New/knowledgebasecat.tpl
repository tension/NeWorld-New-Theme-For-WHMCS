<div class="u-p-medium">
	<div class="row">
		<div class="col-8 col-sm-offset-2">
			<form role="form" method="post" action="{routePath('knowledgebase-search')}" class="u-p-medium">
			    <div class="input-group input-group-lg kb-search">
			        <input type="text"  id="inputKnowledgebaseSearch" name="search" class="form-control" placeholder="What can we help you with?" value="{$searchterm}" />
			        <span class="input-group-btn">
			            <input type="submit" id="btnKnowledgebaseSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
			        </span>
			    </div>
			</form>
		</div>
	</div>
	
	{if $kbcats}
	    <h2>{$LANG.knowledgebasecategories}</h2>
	
	    <div class="row kbcategories">
	        {foreach name=kbasecats from=$kbcats item=kbcat}
	            <div class="col-sm-4">
	                <a href="{routePath('knowledgebase-category-view',{$kbcat.id},{$kbcat.urlfriendlyname})}">
	                    <span class="glyphicon glyphicon-folder-close"></span> {$kbcat.name} <span class="badge badge-info">{$kbcat.numarticles}</span>
	                </a>
	                <p>{$kbcat.description}</p>
	            </div>
	        {/foreach}
	    </div>
	{/if}
	
	{if $kbarticles || !$kbcats}
	    {if $tag}
	        <h4 class="u-mv-small">{$LANG.kbviewingarticlestagged} '{$tag}'</h4>
	    {else}
	        <h4 class="u-mv-small">{$LANG.knowledgebasearticles}</h4>
	    {/if}
	    
		<div class="row">
		    {foreach from=$kbarticles item=kbarticle}
		    <div class="col-sm-6">
		    	<div class="c-card u-p-medium u-mb-small">
			        <h4 class="u-h5">{$kbarticle.title}</h4>
			        <p class="text-muted u-mb-small">{$kbarticle.article|truncate:100:"..."}</p>
			        
			        <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}">
			            {$LANG.more} &raquo;
			        </a>
		    	</div>
		    </div>
		    {/foreach}
		</div>
	{/if}
</div>
