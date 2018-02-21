{if empty($dlcats) }
<div class="u-p-medium">
    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.downloadsnone textcenter=true}
</div>
{else}
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
    <h4>{$LANG.downloadscategories}</h4>

    <div class="row">
        {foreach $dlcats as $dlcat}
        <div class="col-md-4">
            <a class="c-intro-card c-card u-p-medium u-text-center u-mb-medium" href="{routePath('download-by-cat', $dlcat.id, $dlcat.urlfriendlyname)}">
	            <span class="c-intro-card__icon">
                    <i class="fa fa-folder-open-o"></i>
                </span>
                <h3>{$dlcat.name} ({$dlcat.numarticles})</h3>
                {if $dlcat.description}
                <p class="u-text-mute">{$dlcat.description}</p>
                {/if}
            </a>
        </div>
        {foreachelse}
            <div class="col-sm-12">
                <p class="text-center fontsize3">{$LANG.downloadsnone}</p>
            </div>
        {/foreach}
    </div>

    <h4>{$LANG.downloadspopular}</h4>
    <div class="list-group">
        {foreach $mostdownloads as $download}
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
{/if}
