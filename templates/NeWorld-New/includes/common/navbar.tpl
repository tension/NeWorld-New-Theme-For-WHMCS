<header class="c-navbar">
    <button class="c-sidebar-toggle u-mr-small">
        <span class="c-sidebar-toggle__bar"></span>
        <span class="c-sidebar-toggle__bar"></span>
        <span class="c-sidebar-toggle__bar"></span>
    </button>
    <!-- // .c-sidebar-toggle -->

    <div class="u-hidden-down@mobile u-mr-auto">
	    {include file="$template/includes/breadcrumb.tpl"}
	</div>
    
    <div class="u-ml-auto c-dropdown u-hidden-down@mobile">
        <a class="u-mr-xsmall" href="#" id="dropdownMenuLanguage" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="c-notification__icon">
                <i class="fa fa-language"></i>
            </span>
        </a>
        <div class="c-dropdown__menu dropdown-menu dropdown-language" aria-labelledby="dropdownMenuLanguage">
            {foreach $locales as $locale}
                <a class="c-dropdown__item dropdown-item {$locale.language}" href="{$currentpagelinkback} language={$locale.language}">{$locale.localisedName}</a>
            {/foreach}
        </div>
    </div>
	
    {if $adminMasqueradingAsClient || $adminLoggedIn}
	    <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="u-ml-small" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}">
	        <span class="c-notification__icon">
	        	<i class="fa fa-sign-out"></i>
	        </span>
	    </a>
    {/if}

    {if $loggedin}
    <div class="{if count($clientAlerts) > 0}c-dropdown dropdown{/if} u-mr-medium u-ml-small u-hidden-down@mobile">
        <a class="c-notification dropdown-toggle" href="#" {if count($clientAlerts) > 0}id="dropdownMenuAlerts" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"{/if}>
            <span class="c-notification__icon">
                <i class="fa fa-bell-o"></i>
            </span>
            {if count($clientAlerts) > 0}<span class="c-notification__number">{count($clientAlerts)}</span>{/if}
        </a>
        {if count($clientAlerts) > 0}
        <div class="c-dropdown__menu c-dropdown__menu--large dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuAlerts">
            {foreach $clientAlerts as $alert}
            <a href="{$alert->getLink()}" class="c-dropdown__item dropdown-item o-media">
                <span class="o-media__img u-mr-xsmall">
                    <span class="c-avatar c-avatar--xsmall">
                        <span class="c-avatar__img u-bg-{$alert->getSeverity()} u-flex u-justify-center u-align-items-center">
                            <i class="fa fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}warning{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if} u-text-large u-color-white"></i>
                        </span>
                    </span>
                    
                </span>
                <div class="o-media__body">
                    <h6 class="u-mb-zero hide">Completed a task</h6>
                    <p class="u-text-mute">{$alert->getMessage()}</p>
                </div>
            </a>
            {/foreach}
        </div>
        {/if}
    </div>

    <div class="c-account c-dropdown dropdown">
        <a  class="c-avatar c-avatar--xsmall has-dropdown dropdown-toggle" href="#" id="dropdwonMenuAvatar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <img class="c-avatar__img" src="//gravatar.neworld.org/avatar/{$clientsdetails.email|md5}?s=100&d={$systemurl}templates/{$template}/assets/img/default_family.jpg" alt="{$clientsdetails.firstname} {$clientsdetails.lastname}">
        </a>

        <div class="c-dropdown__menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdwonMenuAvatar">
	        <a class="c-dropdown__item dropdown-item" href="{$WEB_ROOT}/clientarea.php">
		        <i class="zmdi zmdi-hc-fw zmdi-hc-lg zmdi-home"></i>{$LANG.clientareanavhome}
		    </a>
	        <a class="c-dropdown__item dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=details">
		        <i class="zmdi zmdi-hc-fw zmdi-hc-lg zmdi-account-box"></i>{$LANG.accountinfo}
		    </a>
            <a class="c-dropdown__item dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=changepw">
	            <i class="zmdi zmdi-hc-fw zmdi-hc-lg zmdi-settings"></i>{$LANG.clientareachangepassword}
	        </a>
            <a class="c-dropdown__item dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=emails">
	            <i class="zmdi zmdi-hc-fw zmdi-hc-lg zmdi-email"></i>{$LANG.navemailssent}
	        </a>
            <a class="c-dropdown__item dropdown-item" href="{$WEB_ROOT}/logout.php">
	            <i class="zmdi zmdi-hc-fw zmdi-hc-lg zmdi-power"></i>{$LANG.clientareanavlogout}
	        </a>
        </div>
    </div>
    
    {else}
		<a class="u-ml-small c-btn c-btn--small c-btn--success" href="{$WEB_ROOT}/clientarea.php">{$LANG.login}</a>    
    {/if}
</header>