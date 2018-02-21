<script>
$(function() {
	$('.form-group .mode').click(function(){
		$(this).addClass('selected');
		$(this).siblings().removeClass('selected');
		$(this).parent().find('input').val($(this).data('mode'));
	});
});
</script>

<div class="block block-rounded block-bordered">
    <ul class="nav nav-tabs" role="tablist">
        <li class="pull-right">
        	<span>{$setting['title']}</span>
        </li>
        <li class="active">
        	<a class="tab-top" href="#tab1" role="tab" data-toggle="tab" id="tabLink1" data-tab-id="1" aria-expanded="true">基本设置</a>
        </li>
        <li>
        	<a class="tab-top" href="#tab2" role="tab" data-toggle="tab" id="tabLink2" data-tab-id="2" aria-expanded="true">模板设置</a>
        </li>
        <li>
        	<a class="tab-top" href="#tab3" role="tab" data-toggle="tab" id="tabLink4" data-tab-id="4" aria-expanded="true">常用参数</a>
        </li>
    </ul>
	<form class="form-horizontal" method="POST" action="{$module}&action={$action}{if $action == 'edit'}&id={$id}{/if}">

    <div class="block-content">
	    <div class="row">
		    <div class="col-md-8 col-md-offset-2">
				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
				        {include file="./tab/tab1.tpl"}
				    </div>
			        <div class="tab-pane" id="tab2">
				        {include file="./tab/tab2.tpl"}
			        </div>
			        <div class="tab-pane" id="tab3">
				        {include file="./tab/tab3.tpl"}
			        </div>
			    </div>
		    </div>
	    </div>
    </div>
    <div class="block-content bg-gray-lighter text-center">
		<button class="btn btn-noborder btn-minw btn-rounded btn-primary push-15-r" type="submit">
			<i class="fa fa-check push-5-r"></i> 确认
		</button>
		<button class="btn btn-noborder btn-minw btn-rounded btn-warning" type="reset">
			<i class="fa fa-refresh push-5-r"></i> 重置
		</button>
	</div>
	</form>
</div>