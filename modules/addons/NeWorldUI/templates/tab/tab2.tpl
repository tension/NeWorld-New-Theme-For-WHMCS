<div class="alert alert-danger" role="alert">
    <strong>填写此处头部与尾部代码将会覆盖系统默认的头部与尾部样式代码，请谨慎使用！</strong>
    <br/>
    <strong>如在本页进行自定义设置导致网站样式变形，请自行处理！</strong>
</div>

<div class="form-group">
    <div class="col-sm-12">
        <label for="cssCode">CSS样式</label>
        <textarea class="form-control" id="cssCode" name="cssCode" rows="5" placeholder="body { ... }">{$setting['cssCode']}</textarea></div>
</div>

<div class="form-group">
    <div class="col-sm-12">
        <label for="topCode">头部代码</label>
        <textarea class="form-control {* tinymce *}" id="topCode" name="topCode" rows="5" placeholder="&lt;div class=&quot;header&quot;&gt;头部代码&lt;/div&gt;">{$setting['topCode']}</textarea></div>
</div>

<div class="form-group">
    <div class="col-sm-12">
        <label for="btmCode">尾部代码</label>
        <textarea class="form-control {* tinymce *}" id="btmCode" name="btmCode" rows="5" placeholder="&lt;div class=&quot;footer&quot;&gt;尾部代码&lt;/div&gt;">{$setting['btmCode']}</textarea></div>
</div>

<div class="form-group">
    <div class="col-sm-12">
        <label for="indexCode">首页代码</label>
        <textarea class="form-control {* tinymce *}" id="indexCode" name="indexCode" rows="5" placeholder="&lt;div class=&quot;idnex&quot;&gt;首页代码&lt;/div&gt;">{$setting['indexCode']}</textarea></div>
</div>