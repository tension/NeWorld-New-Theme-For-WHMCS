<div class="u-p-medium">
	{if $affiliatesystemenabled}
    
	<h2 class="text-center">{$LANG.affiliatesignuptitle}</h2>
	<h4 class="text-center u-text-mute">{$LANG.affiliatesignupintro|cat:'<br /><br />'}</h4>
	
	<div class="row u-mb-large text-center">
        <div class="col-sm-4">
            <img src="{$WEB_ROOT}/templates/{$template}/assets/img/affs/advantage-icon1.png" style="width: 150px;">             
			<h5>推介难度低</h5>
			<p class="u-text-mute">多年积累丰厚资源，产品价格实惠，<br>消费者易接受</p>
        </div>
        <div class="col-sm-4">
            <img src="{$WEB_ROOT}/templates/{$template}/assets/img/affs/advantage-icon2.png" style="width: 150px;">             
			<h5>订单成交率高</h5>
			<p class="u-text-mute">产品基于性能和CN2骨干网络构建，<br>质量高，退款率低</p>
        </div>
        <div class="col-sm-4">
            <img src="{$WEB_ROOT}/templates/{$template}/assets/img/affs/advantage-icon3.png" style="width: 150px;">             
			<h5>提成比例高达25%</h5>
			<p class="u-text-mute">推介成功消费1000元，您将获得<br>高达250元现金提成</p>
        </div>
    </div>
	<div class="row u-mb-large text-center">
        <div class="col-sm-4">
            <img src="{$WEB_ROOT}/templates/{$template}/assets/img/affs/advantage-icon4.png" style="width: 150px;">             
			<h5>完整产品线</h5>
			<p class="u-text-mute">云虚拟主机、云服务器、独立服务器、<br>高防产品均参与推介</p>
        </div>
        <div class="col-sm-4">
            <img src="{$WEB_ROOT}/templates/{$template}/assets/img/affs/advantage-icon5.png" style="width: 150px;">             
			<h5>正规企业运营</h5>
			<p class="u-text-mute">合规全网ISP/IDC资质，自主开发<br>OpenStack云计算平台</p>
        </div>
        <div class="col-sm-4">
            <img src="{$WEB_ROOT}/templates/{$template}/assets/img/affs/advantage-icon6.png" style="width: 150px;">             
			<h5>24x7服务支撑</h5>
			<p class="u-text-mute">7x24小时全天候金牌服务，<br>让您免除后顾之忧</p>
        </div>
    </div>
	
    <ul class="hide">
        <li>{$LANG.affiliatesignupinfo1}</li>
        <li>{$LANG.affiliatesignupinfo2}</li>
        <li>{$LANG.affiliatesignupinfo3}</li>
    </ul>

    <form method="post" action="affiliates.php">
        <input type="hidden" name="activate" value="true" />
        <p align="center"><input type="submit" value="{$LANG.affiliatesactivate}" class="btn btn-success" /></p>
    </form>
	
	{else}
	    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.affiliatesdisabled textcenter=true}
	{/if}
</div>