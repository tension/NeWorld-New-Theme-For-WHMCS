<div class="u-p-medium">
	
	<p class="u-mb-medium">{$LANG.supportticketsheader}</p>
	
    <div class="row">
        {foreach from=$departments key=num item=department}
            <div class="col-md-4">
	            <a class="c-intro-card c-card u-p-medium u-text-center u-mb-medium"  href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}">
		            <span class="c-intro-card__icon">
                        <i class="fa fa-envelope"></i>
                    </span>
                    <h3>{$department.name}</h3>
	                {if $department.description}
	                    <p class="u-text-mute">{$department.description}</p>
	                {/if}
            	</a>
            </div>
        {foreachelse}
        	<div class="u-pl-small">
            	{include file="$template/includes/alert.tpl" type="info" msg=$LANG.nosupportdepartments textcenter=true}
        	</div>
        {/foreach}
    </div>
</div>