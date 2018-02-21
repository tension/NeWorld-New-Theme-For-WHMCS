{if !$loginpage and $templatefile ne "clientregister" and $filename ne 'logout' and $filename ne 'pwreset'}
	{if !$inShoppingCart and ( $templatefile ne 'clientareaproductdetails' and $templatefile ne 'clientareahome' and $templatefile ne "homepage" and $templatefile ne "viewinvoice" )}
				</div>
			</div><!-- /.main-content -->
			{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
            <div class="col-3 sidebar" style="display: none">
                {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
            </div>
	        {/if}
        </div>
	{/if}
	{if $templatefile ne 'clientareaproductdetails' and $templatefile ne "homepage" and !$inShoppingCart and $frontend ne "0"}
	</div>
	{/if}
</main>
{/if}

{if ($templatefile eq 'homepage' or $inShoppingCart or $frontend eq "0") and $loginpage ne "true"}
{* 自定义首页代码 *}
{if $uiManager['btmCode']}
	{include file="$template/includes/custom/footer.tpl"}
{else}
	<div class="footer space">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<a class="navbar-brand" href="#">{$companyname}</a>
					<p>&copy; {$date_year} {$companyname}. {$LANG.allrightsreserved}</p>
				</div>
				<div class="col-sm-2 hidden-xs">
					<h4 class="title-head">{$LANG.footabout}</h4>
					<ul class="list-unstyled">
						<li><a href="#">Company</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Affileates</a></li>
						<li><a href="#">Press</a></li>
						<li><a href="#">Terms</a></li>
					</ul>
				</div>
				<div class="col-sm-2 hidden-xs">
					<h4 class="title-head">{$LANG.footproduct}</h4>
					<ul class="list-unstyled">
						<li><a href="#">Features</a></li>
						<li><a href="#">How it Works</a></li>
						<li><a href="#">Pricing</a></li>
						<li><a href="#">Learn</a></li>
						<li><a href="#">Privavy</a></li>
					</ul>
				</div>
				<div class="col-sm-2 hidden-xs">
					<h4 class="title-head">{$LANG.footsupport}</h4>
					<ul class="list-unstyled">
						<li><a href="#">Documintation</a></li>
						<li><a href="#">Delevopers API</a></li>
						<li><a href="#">Learn</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Status</a></li>
					</ul>
				</div>
				<div class="col-sm-2 hidden-xs">
					<h4 class="title-head">{$LANG.footlearnmore}</h4>
					<ul class="list-unstyled">
						<li><a href="#">Facebook</a></li>
						<li><a href="#">Twitter</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	{/if}
{/if}

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">Title</h4>
            </div>
            <div class="modal-body panel-body">
                Loading...
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-left loader">
                    <i class="fa fa-circle-o-notch fa-spin"></i> Loading...
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Close
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>

{$footeroutput}
{if $uiManager['statistics']}
<div class="hide">
	{$uiManager['statistics']}
</div>
{/if}
</body>
</html>
