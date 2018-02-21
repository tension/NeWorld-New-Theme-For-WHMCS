<!-- Styling -->
<link href="https://fonts.cat.net/css?family=Open+Sans:300,400,600|Raleway:300,400,700" rel="stylesheet">
<link href="https://cdnjs.cat.net/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css?v={$versionHash}" rel="stylesheet">

<link href="{$WEB_ROOT}/templates/{$template}/assets/css/all.min.css?{$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/main.css?1" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/custom.css?70" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var csrfToken = '{$token}',
        markdownGuide = '{lang key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang key="markdown.saved"}',
        saving = '{lang key="markdown.saving"}';
</script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/main.min.js?v=3"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/scripts.min.js?{$versionHash}"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/clipboard.min.js?{$versionHash}"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/lightslider.js?{$versionHash}"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/select2.min.js?{$versionHash}"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/dashboard.js?{$versionHash}"></script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
