<div class="row u-mt-xlarge u-ph-medium">
    <div class="col-md-8 u-mr-auto u-ml-auto u-text-center">
	    <h1>{$displayTitle}</h1>
        <p class="u-text-mute u-text-large u-mb-large">{$LANG.knowledgebaseintrotext}</p>
    </div>
</div>

<div class="row u-mb-large u-ph-medium">
    <div class="col-md-7 u-mr-auto u-ml-auto">
        <div class="c-search-docs">
		    <form role="form" method="post" class="c-field has-icon-right" action="{routePath('knowledgebase-search')}">
                <span class="c-field__icon">
                    <i class="fa fa-search"></i>
                </span>
                <input class="c-input c-intro__search" id="inputKnowledgebaseSearch" type="text" />
                <input type="submit" id="btnKnowledgebaseSearch" class="btn btn-primary btn-input-padded-responsive hide" value="{$LANG.search}" />
		    </form>
        </div>
    </div>
</div>

<div class="u-p-medium">

<h4>{$LANG.knowledgebasecategories}</h4>

{if $kbcats}
    <div class="row">
        {foreach from=$kbcats name=kbcats item=kbcat}
        <div class="col-md-4">
            <a class="c-intro-card c-card u-p-medium u-text-center u-mb-medium" href="{routePath('knowledgebase-category-view', {$kbcat.id}, {$kbcat.urlfriendlyname})}">
	            <span class="c-intro-card__icon">
                    <i class="fa fa-folder-open-o"></i>
                </span>
                <h3>{$kbcat.name} ({$kbcat.numarticles})</h3>
                {if $kbcat.description}
                <p class="u-text-mute">{$kbcat.description}</p>
                {/if}
            </a>
        </div>
        {/foreach}
    </div>
{else}
    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.knowledgebasenoarticles textcenter=true}
{/if}

{if $kbmostviews}
    <h4>{$LANG.knowledgebasepopular}</h4>
	<div class="row">
	    {foreach from=$kbmostviews item=kbarticle}
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
