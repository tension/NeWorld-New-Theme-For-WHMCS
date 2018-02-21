<div class="u-p-medium">
	{if $invalidTicketId}
	
	    {include file="$template/includes/alert.tpl" type="danger" title=$LANG.thereisaproblem msg=$LANG.supportticketinvalid textcenter=true}
	
	{else}
	
	    {if $closedticket}
	        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.supportticketclosedmsg textcenter=true}
	    {/if}
	
	    {if $errormessage}
	        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
	    {/if}
	
	{/if}
	
	{if !$invalidTicketId}
	    <div class="panel panel-default visible-print-block">
	        <div class="panel-heading">
	            <h3 class="panel-title">
	                {$LANG.ticketinfo}
	            </h3>
	        </div>
	        <div class="panel-body container-fluid">
	            <div class="row">
	                <div class="col-md-2 col-xs-6">
	                    <b>{$LANG.supportticketsticketid}</b><br />{$tid}
	                </div>
	                <div class="col-md-4 col-xs-6">
	                    <b>{$LANG.supportticketsticketsubject}</b><br />{$subject}
	                </div>
	                <div class="col-md-2 col-xs-6">
	                    <b>{$LANG.supportticketspriority}</b><br />{$urgency}
	                </div>
	                <div class="col-md-4 col-xs-6">
	                    <b>{$LANG.supportticketsdepartment}</b><br />{$department}
	                </div>
	            </div>
	        </div>
	    </div>
		<div class="c-chat__body">
	    {foreach from=$descreplies key=num item=reply}
	    	<div class="c-chat__message u-ph-zero o-media {if $reply.admin} staff{/if}">
                <div class="o-media__img u-mr-small">
                    <div class="c-avatar c-avatar--small u-mb-small">
                        <div class="c-avatar__img">
                            <img src="//gravatar.neworld.org/avatar/{$reply.email|md5}?s=100&d={$systemurl}templates/{$template}/assets/img/default_family.jpg" alt="{$reply.name}">
                        </div>
                    </div>
                    {if $reply.admin}
                        <span class="c-badge c-badge--info c-badge--small">{$LANG.supportticketsstaff}</span>
                    {elseif $reply.contactid}
                        {$LANG.supportticketscontact}
                    {elseif $reply.userid}
                    	<span class="c-badge c-badge--primary c-badge--small">{$LANG.supportticketsclient}</span>
                    {else}
                        {$reply.email}
                    {/if}
                </div><!-- // .o-media__img -->

                <div class="o-media__body">
                    <h4 class="c-chat__message-author">{$reply.name}</h4>
                    <span class="c-chat__message-time">{$reply.date}</span>
                    {if $reply.id && $reply.admin && $ratingenabled}
	                    <div class="pull-right">
	                        {if $reply.rating}
	                            <div class="rating-done">
	                                {for $rating=1 to 5}
	                                    <span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
	                                {/for}
	                                <div class="rated">{$LANG.ticketreatinggiven}</div>
	                            </div>
	                        {else}
	                            <div class="rating" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
	                                <span class="star" rate="5"></span>
	                                <span class="star" rate="4"></span>
	                                <span class="star" rate="3"></span>
	                                <span class="star" rate="2"></span>
	                                <span class="star" rate="1"></span>
	                            </div>
	                        {/if}
	                    </div>
	                {/if}
                    <div class="c-chat__message-content">{$reply.message}</div>
		            {if $reply.attachments}
		                <div class="attachments">
		                    <strong>{$LANG.supportticketsticketattachments} ({$reply.attachments|count})</strong>
		                    <ul>
		                        {foreach from=$reply.attachments key=num item=attachment}
		                            <li><i class="fa fa-file-o"></i> <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}">{$attachment}</a></li>
		                        {/foreach}
		                    </ul>
		                </div>
		            {/if}
                </div><!-- // .o-media__body -->
            </div>
	    {/foreach}
		</div>
	
	    <div class="hidden-print">
            <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">
				
                <div class="row{if $loggedin} hide{/if}">
                    <div class="form-group col-sm-6">
                        <label for="inputName">{$LANG.supportticketsclientname}</label>
                        {if $loggedin}
                            <input class="form-control disabled" type="text" id="inputName" value="{$clientname}" disabled="disabled" />
                        {else}
                            <input class="form-control" type="text" name="replyname" id="inputName" value="{$replyname}" />
                        {/if}
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="inputEmail">{$LANG.supportticketsclientemail}</label>
                        {if $loggedin}
                            <input class="form-control disabled" type="text" id="inputEmail" value="{$email}" disabled="disabled" />
                        {else}
                        	<input class="form-control" type="text" name="replyemail" id="inputEmail" value="{$replyemail}" />
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputMessage">{$LANG.contactmessage}</label>
                    <textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="client_ticket_reply_{$tid}">{$replymessage}</textarea>
                </div>

                <div class="row form-group">
                    <div class="col-sm-12">
                        <label for="inputAttachments">{$LANG.supportticketsticketattachments}</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="file" name="attachments[]" id="inputAttachments" class="form-control" />
                        <div id="fileUploadsContainer"></div>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-default btn-block" onclick="extraTicketAttachment()">
                            <i class="fa fa-plus"></i> {$LANG.addmore}
                        </button>
                    </div>
                    <div class="col-xs-12 ticket-attachments-message text-muted">
                        {$LANG.supportticketsallowedextensions}: {$allowedfiletypes}
                    </div>
                </div>
				
                <div class="form-group row">
	                <div class="col-sm-2">
                    	<input class="btn btn-primary btn-block" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" />
	                </div>
	                <div class="col-sm-2">
                    	<input class="btn btn-default btn-block" type="reset" value="{$LANG.cancel}" onclick="jQuery('#ticketReply').click()" />
	                </div>
                </div>

            </form>
	    </div>
	
	{/if}
</div>