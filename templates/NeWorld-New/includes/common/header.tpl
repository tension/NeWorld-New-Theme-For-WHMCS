{if $header eq "side"}
<div class="o-page__sidebar js-page-sidebar">
    <div class="c-sidebar c-sidebar--{$uiManager['thememode']}">

        <a class="c-sidebar__brand u-ml-medium" href="{$systemurl}">
            {$companyname}
        </a>
        
        <h4 class="c-sidebar__title">{$LANG.sideaccountcenter}</h4>
        <ul class="c-sidebar__list">
        
            <li class="c-sidebar__item">
	        	<a class="c-sidebar__link {if $templatefile == 'clientareahome'}is-active{/if}" href="{$WEB_ROOT}/clientarea.php">
		        	<i class="zmdi zmdi-hc-fw zmdi-home u-mr-xsmall"></i>{$LANG.clientareatitle}
				</a>
	        </li>
	        {if $loggedin}
            <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link {if $templatefile == 'clientareadetails' || $templatefile == 'clientareacontacts' || $templatefile == 'clientareachangepw' || $templatefile == 'clientareaemails'}is-active{/if}" data-toggle="collapse" href="#sidebar-submenu-account" aria-expanded="false" aria-controls="sidebar-submenu-account">
                    <i class="fa fa-fw fa-user-circle u-mr-xsmall"></i>{$LANG.account}
                </a>
                <ul class="c-sidebar__submenu collapse" id="sidebar-submenu-account">
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
					<li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=emails">{$LANG.navemailssent}</a></li>
                </ul>
            </li>
            
            <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link {if $templatefile == 'supportticketsubmit-stepone' || $templatefile == 'supportticketsubmit-steptwo' || $templatefile == 'supportticketsubmit-kbsuggestions' || $templatefile == 'supportticketsubmit-customfields' || $templatefile == 'supportticketslist'}is-active{/if}" data-toggle="collapse" href="#sidebar-submenu-support" aria-expanded="false" aria-controls="sidebar-submenu-support">
                    <i class="zmdi zmdi-hc-fw zmdi-comment-edit u-mr-xsmall"></i>{$LANG.navsupport}
                </a>
                <ul class="c-sidebar__submenu collapse" id="sidebar-submenu-support">
	        		<li><a class="c-sidebar__link" href="{$WEB_ROOT}/submitticket.php">{$LANG.navopenticket}</a></li>
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/supporttickets.php">{$LANG.navtickets}</a></li>
                </ul>
            </li>
            {/if}
        </ul>
        {if $loggedin}
        <h4 class="c-sidebar__title">{$LANG.sideservices}</h4>
        <ul class="c-sidebar__list">
	        
            <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link {if $templatefile == 'clientareaproducts' || $templatefile == 'clientareaproductdetails'}is-active{/if}" data-toggle="collapse" href="#sidebar-submenu-service" aria-expanded="false" aria-controls="sidebar-submenu-service">
                    <i class="zmdi zmdi-hc-fw zmdi-widgets u-mr-xsmall"></i>{$LANG.navservices}
                </a>
                <ul class="c-sidebar__submenu collapse" id="sidebar-submenu-service">
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=services">{$LANG.clientareanavservices}</a></li>
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/cart.php">{$LANG.navservicesorder}</a></li>
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/cart.php?gid=addons">{$LANG.clientareaviewaddons}</a></li>
                </ul>
            </li>
            
	        {if $condlinks.domainreg or $condlinks.domaintrans}
            <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link {if $templatefile == 'clientareadomains'}is-active{/if}" data-toggle="collapse" href="#sidebar-submenu-domain" aria-expanded="false" aria-controls="sidebar-submenu-domain">
                    <i class="zmdi zmdi-hc-fw zmdi-globe-alt u-mr-xsmall"></i>{$LANG.navdomains}
                </a>
                <ul class="c-sidebar__submenu collapse" id="sidebar-submenu-domain">
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=domains">{$LANG.clientareanavdomains}</a></li>
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/cart.php?gid=renewals">{$LANG.navrenewdomains}</a></li>
	                {if $condlinks.domainreg}
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/cart.php?a=add&domain=register">{$LANG.navregisterdomain}</a></li>
	                {/if}
	                {if $condlinks.domaintrans}
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">{$LANG.navtransferdomain}</a></li>
	                {/if}
	                {if $enomnewtldsenabled}
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/{$enomnewtldslink}">Preregister New TLDs</a></li>
	                {/if}
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/domainchecker.php">{$LANG.navwhoislookup}</a></li>
                </ul>
            </li>
	        {/if}
        </ul>
        
        <h4 class="c-sidebar__title">{$LANG.sidefinance}</h4>
        <ul class="c-sidebar__list">
            <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link {if $templatefile == 'clientareainvoices' || $templatefile == 'clientareaquotes' || $templatefile == 'clientareacreditcard' || $templatefile == 'clientareaaddfunds' || $templatefile == 'masspay'}is-active{/if}" data-toggle="collapse" href="#sidebar-submenu-billing" aria-expanded="false" aria-controls="sidebar-submenu-billing">
                    <i class="zmdi zmdi-hc-fw zmdi-balance-wallet u-mr-xsmall"></i>{$LANG.navbilling}
                </a>
                <ul class="c-sidebar__submenu collapse" id="sidebar-submenu-billing">
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=invoices">{$LANG.invoices}</a></li>
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=quotes">{$LANG.quotestitle}</a></li>
	                {if $condlinks.addfunds}
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=addfunds">{$LANG.addfunds}</a></li>
	                {/if}
	                {if $condlinks.masspay}
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=masspay&all=true">{$LANG.masspaytitle}</a></li>
	                {/if}
	                {if $condlinks.updatecc}
	                <li><a class="c-sidebar__link" href="{$WEB_ROOT}/clientarea.php?action=creditcard">{$LANG.navmanagecc}</a></li>
	                {/if}
                </ul>
            </li>
	        {if $condlinks.affiliates}
            <li class="c-sidebar__item">
                <a class="c-sidebar__link {if $templatefile == 'affiliates'}is-active{/if}" href="{$WEB_ROOT}/affiliates.php">
                    <i class="fa fa-fw fa-universal-access u-mr-xsmall"></i>{$LANG.affiliatestitle}
                </a>
            </li>
	        {/if}
        </ul>
        {/if}

        <h4 class="c-sidebar__title">{$LANG.navsupport}</h4>
        <ul class="c-sidebar__list">
            <li class="c-sidebar__item">
                <a class="c-sidebar__link {if $templatefile == 'announcements'}is-active{/if}" href="{$WEB_ROOT}/announcements.php">
                    <i class="fa fa-fw fa-bell u-mr-xsmall"></i>{$LANG.announcementstitle}
                </a>
            </li>
            <li class="c-sidebar__item">
            	<a class="c-sidebar__link {if $templatefile == 'knowledgebase'}is-active{/if}" href="{$WEB_ROOT}/knowledgebase.php">
	            	<i class="fa fa-fw fa-life-ring u-mr-xsmall"></i>{$LANG.knowledgebasetitle}
	            </a>
	        </li>
	        {if $loggedin}
            <li class="c-sidebar__item">
                <a class="c-sidebar__link {if $templatefile == 'downloads'}is-active{/if}" href="{$WEB_ROOT}/downloads.php">
                    <i class="fa fa-fw fa-cloud-download u-mr-xsmall"></i>{$LANG.downloadstitle}
                </a>
            </li>
            {/if}
	        {if $condlinks.networkstatus}
            <li class="c-sidebar__item">
                <a class="c-sidebar__link {if $templatefile == 'serverstatus'}is-active{/if}" href="{$WEB_ROOT}/serverstatus.php">
                    <i class="fa fa-fw fa-dot-circle-o u-mr-xsmall"></i>{$LANG.networkstatustitle}
                </a>
            </li>
	        {/if}
        </ul>

    </div><!-- // .c-sidebar -->
</div><!-- // .o-page__sidebar -->
{else}
<header class="c-navbar">
	<div class="container">
	    <a class="c-navbar_brand" href="{$systemurl}">
	        {$companyname}
	    </a>
	   
	   <!-- Navigation items that will be collapes and toggle in small viewports -->
	    <nav class="c-nav u-ml-auto collapse" id="main-nav">
	        <ul class="c-nav__list">
	            <li class="c-nav__item">
	                <a class="c-nav__link" href="{$systemurl}">网站首页</a>
	            </li>
	            <li class="c-nav__item dropdown">
					<a class="c-nav__link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						产品中心
					</a>
					<div class="c-dropdown__menu dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="c-dropdown__item dropdown-item" href="{$systemurl}pages.php?page=cloud">虚拟主机</a>
						<a class="c-dropdown__item dropdown-item" href="{$systemurl}pages.php?page=dedicated">服务器租用</a>
					</div>
				</li>
	            <li class="c-nav__item">
	                <a class="c-nav__link" href="https://demo.neworld.org/datecenter/">数据中心</a>
	            </li>
	            <li class="c-nav__item">
	                <a class="c-nav__link" href="https://demo.neworld.org/about/">技术支持</a>
	            </li>
	            <li class="c-nav__item">
	                <a class="c-nav__link" href="https://demo.neworld.org/about/">关于我们</a>
	            </li>
	        </ul>
	    
	    {if $loggedin}
	    <div class="c-dropdown dropdown u-ml-large">
	        <a  class="c-avatar c-avatar--xsmall has-dropdown dropdown-toggle" href="#" id="dropdwonMenuAvatar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <img class="c-avatar__img" src="//gravatar.neworld.org/avatar/{$clientsdetails.email|md5}?s=100&d={$systemurl}templates/{$template}/assets/img/default_family.jpg" alt="User's Profile Picture">
	        </a>
	
	        <div class="c-dropdown__menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdwonMenuAvatar">
		        <a class="c-dropdown__item dropdown-item" href="{$WEB_ROOT}/clientarea.php">
			        <i class="zmdi zmdi-hc-fw zmdi-hc-lg zmdi-home"></i>{$LANG.clientareanavhome}
			    </a>
		        <a class="c-dropdown__item dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=details">
			        <i class="zmdi zmdi-hc-fw zmdi-hc-lg zmdi-account-box"></i>{$LANG.accountinfo}
			    </a>
			    {if $linkableProviders or $securityquestionsenabled or $twofaactivation}
	            <a class="c-dropdown__item dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=security">
		            <i class="zmdi zmdi-hc-fw zmdi-hc-lg zmdi-shield-security"></i>{$LANG.clientareasecurity}
		        </a>
		        {/if}
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
		    <a class="u-ml-large c-btn c-btn--success" href="{$WEB_ROOT}/clientarea.php">{$LANG.login}</a>
		{/if}
	    </nav>
	    <!-- // Navigation items  -->
	    <button class="c-nav-toggle u-ml-auto" type="button" data-toggle="collapse" data-target="#main-nav">
	        <span class="c-nav-toggle__bar"></span>
	        <span class="c-nav-toggle__bar"></span>
	        <span class="c-nav-toggle__bar"></span>
	    </button><!-- // .c-nav-toggle -->
	</div>
</header>
{/if}