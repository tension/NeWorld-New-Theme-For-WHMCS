{foreach $sidebar as $item}
	{if $item->getName() == 'Service Details Overview'}<div class="hide">{/if}
	    <div class="dropdown" menuItemName="{$item->getName()}">
		    <button class="btn btn-default dropdown-toggle" type="button"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if} data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                {if $item->hasIcon()}<span class="glyphicon glyphicon-option-vertical" aria-hidden="true"></span>{/if}
				<span class="hidden">{$item->getLabel()}</span>
			</button>
			<ul class="dropdown-menu"{if $item->getAttribute('id')} aria-labelledby="{$item->getAttribute('id')}"{/if}>
	            {foreach $item->getChildren() as $childItem}
	                {if $childItem->getUri()}
	                    <li><a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="{if $childItem->isDisabled()} disabled{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
	                        {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
	                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
	                        {$childItem->getLabel()}
	                    </a></li>
	                {else}
	                    <div menuItemName="{$childItem->getName()}" class="{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
	                        {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
	                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
	                        {$childItem->getLabel()}
	                    </div>
	                {/if}
	            {/foreach}
			</ul>
	    </div>
	{if $item->getName() == 'Service Details Overview'}
	</div>
	{/if}
{/foreach}
