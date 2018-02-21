<ol class="c-breadcrumb">
    {foreach $breadcrumb as $item}
        <li class="c-breadcrumb__item {if $item@last} is-active{/if}">
            {if !$item@last}<a href="{$item.link}">{/if}
            {$item.label}
            {if !$item@last}</a>{/if}
        </li>
    {/foreach}
</ol>
