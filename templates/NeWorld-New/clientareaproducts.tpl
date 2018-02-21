{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="3"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableServicesList').removeClass('hidden').DataTable();
        {if $orderby == 'product'}
            table.order([0, '{$sort}'], [3, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'nextduedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(3, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
<div class="table-container clearfix">
    <table id="tableServicesList" class="table table-list hidden">
	    <colgroup>
            <col style="width:40%">
            <col style="width:10%"> 
            <col style="width:10%">
            <col style="width:15%">
            <col style="width:10%">
            <col style="width:10%">
        </colgroup>
        <thead>
            <tr>
                <th>{$LANG.orderproduct}</th>
                <th class="hidden-xs">{$LANG.clientareaaddonpricing}</th>
                <th class="hidden-xs">{$LANG.cartchoosecycle}</th>
                <th class="hidden-xs">{$LANG.clientareahostingnextduedate}</th>
                <th>{$LANG.clientareastatus}</th>
                <th class="hidden-xs"></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=num item=service from=$services}
                <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
                    <td><strong>{$service.product}</strong>{if $service.domain}<br /><a href="http://{$service.domain}" target="_blank">{$service.domain}</a>{/if}</td>
                    <td class="text-center hidden-xs" data-order="{$service.amountnum}">{$service.amount}</td>
                    <td class="text-center hidden-xs" data-order="{$service.billingcycle}">{$service.billingcycle}</td>
                    <td class="text-center hidden-xs"><span class="hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td>
                    <td class="text-center">
	                    <i class="fa fa-circle-o u-color-{$service.status|strtolower} u-mr-xsmall"></i>
	                    {$service.statustext}
	                </td>
                    <td class="hidden-xs">
                        <a href="clientarea.php?action=productdetails&amp;id={$service.id}" class="btn btn-sm btn-block btn-default {if $service.status != 'active'}Disabled{/if}" style="width: auto;">
                            {$LANG.manageproduct}
                        </a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fa fa-spinner fa-spin"></i> {$LANG.loading}</p>
    </div>
</div>
