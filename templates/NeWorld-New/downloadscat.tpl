<div class="row u-mt-xlarge u-ph-medium">
    <div class="col-md-8 u-mr-auto u-ml-auto u-text-center">
	    <h1>{$displayTitle}</h1>
        <p class="u-text-mute u-text-large u-mb-large">{$LANG.downloadsintrotext}</p>
    </div>
</div>
<div class="row u-mb-large u-ph-medium">
    <div class="col-md-7 u-mr-auto u-ml-auto">
        <div class="c-search-docs">
		    <form role="form" method="post" class="c-field has-icon-right" action="{routePath('download-search')}">
                <span class="c-field__icon">
                    <i class="fa fa-search"></i>
                </span>
                <input class="c-input c-intro__search" type="text" placeholder="{$LANG.downloadssearch}">
                <input type="submit" id="btnDownloadsSearch" class="btn btn-primary btn-input-padded-responsive hide" value="{$LANG.search}" />
		    </form>
        </div>
    </div>
</div>

<div class="u-p-medium">

	{if $dlcats}
	
	    <h4>{$LANG.knowledgebasecategories}</h4>
	
	    <div class="row">
	        {foreach $dlcats as $dlcat}
	            <div class="col-sm-6">
	                <a href="{routePath('download-by-cat', $dlcat.id, $dlcat.urlfriendlyname)}">
	                    <i class="fa fa-folder-open-o"></i>
	                    <strong>{$dlcat.name}</strong>
	                </a>
	                ({$dlcat.numarticles})
	                <br>
	                {$dlcat.description}
	            </div>
	        {foreachelse}
	            <div class="col-sm-12">
	                <p class="text-center fontsize3">{$LANG.downloadsnone}</p>
	            </div>
	        {/foreach}
	    </div>
	{/if}
	
	<h4>{$LANG.downloadsfiles}</h4>
	
	<div class="list-group">
	    {foreach $downloads as $download}
	        <a href="{$download.link}" class="list-group-item">
	            <strong>
	                <i class="fa fa-download"></i>
	                {$download.title}
	                {if $download.clientsonly}
	                    <i class="fa fa-lock text-muted"></i>
	                {/if}
	            </strong>
	            <br>
	            {$download.description}
	            <br>
	            <small>{$LANG.downloadsfilesize}: {$download.filesize}</small>
	        </a>
	    {foreachelse}
	        <span class="list-group-item text-center">
	            {$LANG.downloadsnone}
	        </span>
	    {/foreach}
	</div>
	
</div>