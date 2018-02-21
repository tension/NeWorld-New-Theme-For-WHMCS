<div class="form-group">
    <label for="thememode" class="col-sm-2 control-label">配色模式</label>
    <div class="col-sm-10">
	    <div class="row">
	    	<input type="hidden" name="thememode" value="{$setting['thememode']}" />
		    <div class="col-sm-4 mode{if $setting['thememode'] eq "dark"} selected{/if}" data-mode="dark">
				<a class="box" style="background-image: url('{$assets}assets/img/thememode1.png');">Dark</a>
		    </div>
		    <div class="col-sm-4 mode{if $setting['thememode'] eq "light"} selected{/if}" data-mode="light">
				<a class="box" style="background-image: url('{$assets}assets/img/thememode2.png');">Light</a>
		    </div>
	    </div>
    </div>
</div>

<div class="form-group">
    <label for="loginmode" class="col-sm-2 control-label">登陆样式</label>
    <div class="col-sm-10">
	    <div class="row">
		    <input type="hidden" name="loginmode" value="{$setting['loginmode']}" />
		    <div class="col-sm-4 mode{if $setting['loginmode'] eq "default"} selected{/if}" data-mode="default">
				<a class="box" style="background-image: url('{$assets}assets/img/loginmode1.png');">样式一</a>
		    </div>
		    <div class="col-sm-4 mode{if $setting['loginmode'] eq "especial"} selected{/if}" data-mode="especial">
				<a class="box" style="background-image: url('{$assets}assets/img/loginmode2.png');">样式二</a>
		    </div>
	    </div>
    </div>
</div>

{if $setting['loginmode'] eq "especial"}
<div class="form-group">
    <label for="login2title" class="col-sm-2 control-label">登录页标题</label>
    <div class="col-sm-10">
        <input class="form-control" type="text" id="login2title" name="login2title" placeholder="输入标题.." value="{$setting['login2title']}" />
    </div>
</div>

<div class="form-group">
    <label for="login2value" class="col-sm-2 control-label">登录页内容</label>
    <div class="col-sm-10">
        <input class="form-control" type="text" id="login2value" name="login2value" placeholder="输入内容.." value="{$setting['login2value']}" />
    </div>
</div>
{/if}

<div class="form-group">
    <label for="cartmode" class="col-sm-2 control-label">购物车样式</label>
    <div class="col-sm-10">
	    <div class="row">
		    <input type="hidden" name="cartmode" value="{$setting['cartmode']}" />
		    <div class="col-sm-4 mode{if $setting['cartmode'] eq "light"} selected{/if}" data-mode="light">
				<a class="box" style="background-image: url('{$assets}assets/img/cartmode1.png');">样式一</a>
		    </div>
		    <div class="col-sm-4 mode{if $setting['cartmode'] eq "dark"} selected{/if}" data-mode="dark">
				<a class="box" style="background-image: url('{$assets}assets/img/cartmode2.png');">样式二</a>
		    </div>
	    </div>
    </div>
</div>

<div class="form-group">
    <label for="statistics" class="col-sm-2 control-label">统计代码</label>
    <div class="col-sm-10">
        <textarea class="form-control" id="statistics" name="statistics" rows="4" placeholder="输入您的统计代码..">{$setting['statistics']}</textarea></div>
</div>