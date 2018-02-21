<div class="c-card c-overview-card u-p-medium u-mb-medium">
    <div class="row">
        <div class="col-6 col-md-3 u-border-right">
            <div class="c-overview-card__section u-text-center">
                <a style="width: 70px;margin: 0 auto;" class="c-avatar u-mb-small" href="clientarea.php?action=details">
					<img class="c-avatar__img" src="//gravatar.neworld.org/avatar/{$clientsdetails.email|md5}?s=100&d={$systemurl}templates/{$template}/assets/img/default_family.jpg" alt="" />
				</a>
				<div class="user-name u-mb-small">
					{if $clientsdetails.firstname != '' && $clientsdetails.lastname != '' && $clientsdetails.lastname != '姓' && $clientsdetails.firstname != '名'}
					<a class="text-primary" href="clientarea.php?action=details">{$clientsdetails.firstname} {$clientsdetails.lastname}</a>
					{else}
					<a class="text-primary" href="clientarea.php?action=details">{$clientsdetails.email}</a>
					{/if}
				</div>
				<div class="row hide">
					<div class="col-6">
						{$qqlink}
					</div>
					<div class="col-6">
						{$wechatlink}
					</div>
				</div>
            </div>
        </div>

        <div class="col-6 col-md-3 u-border-right">
            <div class="c-overview-card__section">
                <p class="u-text-mute u-nospace u-mb-small">{$LANG.availcreditbal}</p>
                <h3 class="u-nospace u-mb-medium">{$clientsstats.creditbalance}</h3>
				{if $condlinks.addfunds}
					<a class="c-btn c-btn--small c-btn--success" href="clientarea.php?action=addfunds">{$LANG.addfunds}</a>
				{/if}
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="c-overview-card__section">
                <p class="u-text-mute u-nospace u-mb-small">{$LANG.navinvoices}</p>
                <h3 class="u-nospace u-mb-medium">{$clientsstats.numunpaidinvoices}</h3>

                <a href="clientarea.php?action=services">{$LANG.navservices}</a>
				<span class="margin-left-1 ng-binding">{$clientsstats.productsnumactive}</span>
				{if $registerdomainenabled || $transferdomainenabled}
				<span class="user-opt-gap"></span>
				<a href="clientarea.php?action=domains">{$LANG.navdomains}</a>
				<span class="margin-left-1 ng-binding">{$clientsstats.numactivedomains}</span>
				{/if}
            </div>
        </div>

        <div class="col-6 col-md-3 u-border-left">
            <div class="c-overview-card__section">
                <p class="u-text-mute u-nospace u-mb-small">{$LANG.navtickets}</p>
                <h3 class="u-nospace u-mb-medium">{$clientsstats.numactivetickets}</h3>

                <a class="c-btn c-btn--small c-btn--info" href="submitticket.php">{$LANG.navopenticket}</a>
            </div>
        </div>
    </div>

</div>