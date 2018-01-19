<nav class="navbar navbar-expand-lg navbar-light bg-light">
	{if $GLOBAL.config.poolnav_enabled|default:"false"}
		<ul class="nav navbar-nav navbar-top-links">
		  <li class="dropdown">
			<a href="#" class="navbar-brand dropdown-toggle" data-toggle="dropdown">{$GLOBAL.website.name} <b class="caret"></b></a>
			<ul class="dropdown-menu">
			  {assign var="PoolArray" value="\n"|explode:$GLOBAL.config.poolnav_pools}
			  {foreach from=$PoolArray item=pooldata}
			  {assign var="PoolURL" value="|"|explode:$pooldata}
			  {if $PoolURL|count > 1}
			  <li class="h4"><a href="{$PoolURL[1]}"><i class="fa fa-angle-double-right fa-fw"></i> {$PoolURL[0]}</a></li>
			  {/if}
			  {/foreach}
			</ul>
		  </li>
		</ul>
		{else}
		<a class="navbar-brand" href="{$smarty.server.SCRIPT_NAME}">{$GLOBAL.website.name}</a>
	{/if}
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	{include file="global/navigation.tpl"}
  
	<ul class="nav navbar-top-links navbar-right">
		{if $smarty.session.AUTHENTICATED|default:"0" == 1 && $GLOBAL.userdata.lastnotifications|@count|default:"0" != 0}
		<li class="dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fa fa-bullhorn fa-fw"></i>
			</a>
			<ul class="dropdown-menu dropdown-alerts dropdown-menu-right">
				{section notification $GLOBAL.userdata.lastnotifications}
					<li>
						<a href="#">
							<div>
								{if $GLOBAL.userdata.lastnotifications[notification].type == new_block}<i class="fa fa-th-large fa-fw"></i> New Block
								{else if $GLOBAL.userdata.lastnotifications[notification].type == payout}<i class="fa fa-money fa-fw"></i> Payout
								{else if $GLOBAL.userdata.lastnotifications[notification].type == idle_worker}<i class="fa fa-desktop fa-fw"></i> IDLE Worker
								{else if $GLOBAL.userdata.lastnotifications[notification].type == success_login}<i class="fa fa-sign-in fa-fw"></i> Successful Login
								{/if}
								<span class="pull-right text-muted small">{$GLOBAL.userdata.lastnotifications[notification].time|relative_date}</span>
							</div>
						</a>
					</li>
					<li class="divider"></li>
				{/section}

				<li>
					<a class="text-center" href="{$smarty.server.SCRIPT_NAME}?page=account&action=notifications">
						<strong>See All Notifications</strong>
						<i class="fa fa-angle-right"></i>
					</a>
				</li>
			</ul>
		</li>
		{/if}
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  {if $GLOBAL.userdata.username|default}{$smarty.session.USERDATA.username|escape}{else}Guest{/if}
			</a>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
				{if $smarty.session.AUTHENTICATED|default:"0" == 1}
				<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
				<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=edit"><i class="fa fa-gear fa-fw"></i> Settings</a>
				<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=workers"><i class="fa fa-desktop fa-fw"></i> Workers</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
				{else}
				<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=login"><i class="fa fa-sign-in fa-fw"></i> Login</a>
				<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=register"><i class="fa fa-pencil fa-fw"></i> Sign Up</a>
				{/if}
			</div>
		</li>
	</ul>
</nav>

            
