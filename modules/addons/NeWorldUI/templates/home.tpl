<link rel="stylesheet" href="{$assets}assets/select2/select2.min.css">
<link rel="stylesheet" href="{$assets}assets/select2/select2-bootstrap.min.css">
<link rel="stylesheet" href="{$assets}assets/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
<link rel="stylesheet" href="{$assets}assets/css/style.css?4">
<style type="text/css">
    h1 {
        display: none;
    }
</style>

{include file="./navbar.tpl"}

<div class="row">
    <div class="col-md-12">
		{if $notice}
	        {$notice}
	    {/if}
    </div>
    <div class="col-md-12">
        {include file="./$PageName.tpl"}
    </div>
    <div class="col-xs-12 foot text-center">
        <p>Copyright &copy NeWorld Cloud Ltd. All Rights Reserved.</p>
    </div>
</div>
<script>
    $(function() {
		$('.js-select2').select2({
			minimumResultsForSearch: Infinity,
			width: '100%'
		});
		$('.js-colorpicker').colorpicker();
    });
</script>
<script src="{$assets}assets/sweetalert/sweetalert.min.js"></script>
<script src="{$assets}assets/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="{$assets}assets/select2/select2.full.min.js"></script>