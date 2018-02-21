<div class="u-p-medium">
	{if $addfundsdisabled}
	    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareaaddfundsdisabled textcenter=true}
	{elseif $notallowed}
	    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareaaddfundsnotallowed textcenter=true}
	{elseif $errormessage}
	    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}
	{/if}
	
	{if !$addfundsdisabled}
	
		<div class="row">
			<div class="col-sm-8">
				<form method="post" action="{$smarty.server.PHP_SELF}?action=addfunds" class="c-field">
				    <div class="row">
			            <div class="form-group col-12">
			                <label for="amount" class="control-label">{$LANG.addfundsamount}:</label>
			                <div class="row money">
				            	<div class="col-6 col-sm-3">
					            	<a class="addmoeny" data-money="100">100</a>
				            	</div>
				            	<div class="col-6 col-sm-3">
					            	<a class="addmoeny" data-money="500">500</a>
				            	</div>
				            	<div class="col-6 col-sm-3">
					            	<a class="addmoeny" data-money="1000">1000</a>
				            	</div>
				            	<div class="col-6 col-sm-3">
					            	<a class="addmoeny" data-money="5000">5000</a>
				            	</div>
			                </div>
			            </div>
			            <div class="form-group col-12 col-sm-8 u-mb-medium">
			                <label for="amount" class="control-label">其他金额:</label>
					        <input type="text" name="amount" id="amount" value="{$amount}" class="form-control" required />
			            </div>
			            <div class="form-group col-12 u-mb-medium">
			                <label for="paymentmethod" class="control-label">{$LANG.orderpaymentmethod}:</label>
			                <input type="hidden" name="paymentmethod">
			                <ul class="list-unstyled row">
			                    {foreach from=$gateways item=gateway}
			                        <li class="col-6 col-sm-4 pay_method text-center">
			                        	<a class="{$gateway.sysname}" data-type="{$gateway.sysname}">
			                            	<div class="icon" style="background-image: url('{$WEB_ROOT}/templates/{$template}/assets/img/{$gateway.sysname}.svg?1')"></div>
			                            	<span class="name hide">{$gateway.name}</span>
			                        	</a>
			                        </li>
			                    {/foreach}
			                </ul>
			            </div>
			            <div class="form-group col-12">
			            	<p class="text-success">{$LANG.addfundsnonrefundable}</p>
			            </div>
			            <div class="form-group col-12">
			                <input type="submit" value="{$LANG.addfunds}" class="btn btn-primary" />
			            </div>
				    </div>
		        </form>
			</div>
	        <div class="col-sm-4">
	            <div class="panel" style="margin-top: 26px;">
	                <table class="table table-striped">
	                    <tbody>
		                    <tr>
		                        <td class="textright"><strong>{$LANG.addfundsminimum}</strong></td>
		                        <td>{$minimumamount}</td>
		                    </tr>
		                    <tr>
		                        <td class="textright"><strong>{$LANG.addfundsmaximum}</strong></td>
		                        <td>{$maximumamount}</td>
		                    </tr>
		                    <tr>
		                        <td class="textright"><strong>{$LANG.addfundsmaximumbalance}</strong></td>
		                        <td>{$maximumbalance}</td>
		                    </tr>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	
	{/if}
	<script type="text/javascript">
	  $(function(){
		  $('.addmoeny').click(function(){
			  var val = $(this).data('money');
			  $('#amount').val(val);
	      });
	      $('.pay_method').click(function(){
	        var payway=$(this).find('a').data('type');
	        $("input[name='paymentmethod']").val(payway);
	        $(this).siblings('li').find('a').css('border-color','#d7dbe0');
	        $(this).find('a').css('border-color','#25A7D9');
	      });
	  });
	</script>
</div>