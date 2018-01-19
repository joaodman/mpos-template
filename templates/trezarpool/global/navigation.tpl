<div class="collapse navbar-collapse" id="navbarSupportedContent">
	<ul class="navbar-nav mr-auto">
		<li class="nav-item">
			<a class="nav-link" href="{$smarty.server.SCRIPT_NAME}"><i class="fa fa-home fa-fw"></i> Home </a>
		</li>
		{if $smarty.session.AUTHENTICATED|default:"0" == 1}
			<li class="nav-item">
				<a class="nav-link" href="{$smarty.server.SCRIPT_NAME}?page=dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				  <i class="fa fa-user-md fa-fw"></i> My Account
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=edit"><i class="fa fa-edit fa-fw"></i> Edit Account</a>
				  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=workers"><i class="fa fa-desktop fa-fw"></i> My Workers</a>
				  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=transactions"><i class="fa fa-credit-card fa-fw"></i> Transactions</a></a>
				  {if !$GLOBAL.config.disable_transactionsummary}<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=earnings"><i class="fa fa-money fa-fw"></i> Earnings</a>{/if}
				  {if !$GLOBAL.config.disable_notifications}<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=notifications"><i class="fa fa-bullhorn fa-fw"></i> Notifications</a>{/if}
				  {if !$GLOBAL.config.disable_invitations}<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=invitations"><i class="fa fa-users fa-fw"></i> Invitations</a>{/if}
				  {if !$GLOBAL.acl.qrcode}<a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=account&action=qrcode"><i class="fa fa-qrcode fa-fw"></i> QR Codes</a>{/if}
				</div>
			</li>
			{if $GLOBAL.userdata.is_admin == 1}
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-wrench fa-fw"></i> Admin Panel<span class="fa arrow"></span>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a href="#"><i class="fa fa-linux fa-fw"></i> System <span class="fa arrow"></span></a>
						<ul class="nav nav-third-level">
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=setup"><i class="fa fa-book fa-fw"></i> Setup</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=monitoring"><i class="fa fa-bell-o fa-fw"></i> Monitoring</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=settings"><i class="fa fa-gears fa-fw"></i> Settings</a>
						</ul>
					  
						<a href="#"><i class="fa fa-usd fa-fw"></i> Funds <span class="fa arrow"></span></a>
						<ul class="nav nav-third-level">
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=wallet"><i class="fa fa-money fa-fw"></i> Wallet Info</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=transactions"><i class="fa fa-tasks fa-fw"></i> Transactions</a>
						</ul>
						
						<a href="#"><i class="fa fa-info fa-fw"></i> News <span class="fa arrow"></span></a>
						<ul class="nav nav-third-level">
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=news"><i class="fa fa-list-alt fa-fw"></i> Site News</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=newsletter"><i class="fa fa-list-alt fa-fw"></i> Newsletter</a>
						</ul>
						
						<a href="#"><i class="fa fa-users fa-fw"></i> Users <span class="fa arrow"></span></a>
						<ul class="nav nav-third-level">
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=user"><i class="fa fa-user fa-fw"></i> User Info</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=reports"><i class="fa fa-list-ol fa-fw"></i> Reports</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=registrations"><i class="fa fa-pencil-square-o fa-fw"></i> Registrations</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=invitations"><i class="fa fa-users fa-fw"></i> Invitations</a>
						  <a class="dropdown-item" href="{$smarty.server.SCRIPT_NAME}?page=admin&action=poolworkers"><i class="fa fa-desktop fa-fw"></i> Pool Workers</a>
						</ul>
					</div>
				</li>
			{/if}
		{/if}
		
		{if ($GLOBAL.acl.statistics.loggedin|default:"0" == 0 && ($smarty.session.AUTHENTICATED|default:"0" == 0 OR $smarty.session.AUTHENTICATED|default:"0" == 1)) OR ($GLOBAL.acl.statistics.loggedin|default:"0" == 1 && $smarty.session.AUTHENTICATED|default:"0" == 1)}
			<li {if $smarty.get.page|default:"0" eq "statistics"}class="active"{/if}>
				<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Statistics<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
				  {acl_check page='statistics' action='pool' name='<i class="fa fa-align-left fa-fw"></i> Pool' acl=$GLOBAL.acl.pool.statistics fallback='page=statistics'}
				  {acl_check page='statistics' action='blocks' name='<i class="fa fa-th-large fa-fw"></i> Blocks' acl=$GLOBAL.acl.block.statistics}
				  {acl_check page='statistics' action='round' name='<i class="fa fa-refresh fa-fw"></i> Round' acl=$GLOBAL.acl.round.statistics}
				  {acl_check page='statistics' action='blockfinder' name='<i class="fa fa-search fa-fw"></i> Blockfinder' acl=$GLOBAL.acl.blockfinder.statistics}
				  {acl_check page='statistics' action='uptime' name='<i class="fa fa-clock-o fa-fw"></i> Uptime' acl=$GLOBAL.acl.uptime.statistics}
				  {acl_check page='statistics' action='graphs' name='<i class="fa fa-signal fa-fw"></i> Graphs' acl=$GLOBAL.acl.graphs.statistics}
				  {acl_check page='statistics' action='donors' name='<i class="fa fa-bitbucket fa-fw"></i> Donors' acl=$GLOBAL.acl.donors.page}
				</ul>
				<!-- /.nav-second-level -->
			</li>
		{/if}
		{if ($GLOBAL.acl.help.loggedin|default:"0" == 0 && ($smarty.session.AUTHENTICATED|default:"0" == 0 OR $smarty.session.AUTHENTICATED|default:"0" == 1)) OR ($GLOBAL.acl.help.loggedin|default:"0" == 1 && $smarty.session.AUTHENTICATED|default:"0" == 1)}
			<li {if $smarty.get.page|default:"0" eq "gettingstarted" || $smarty.get.page|default:"0" eq "about"}class="active"{/if}>
				<a href="#"><i class="fa fa-question fa-fw"></i> Help<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
				  <li><a href="{$smarty.server.SCRIPT_NAME}?page=gettingstarted"><i class="fa fa-question fa-fw"></i> Getting Started</a></li>
				  {acl_check page='about' action='pool' name='<i class="fa fa-info fa-fw"></i> About' acl=$GLOBAL.acl.about.page}
				  {acl_check page='about' action='chat' name='<i class="fa fa-comments-o fa-fw"></i> Web Chat' acl=$GLOBAL.acl.chat.page}
				  {acl_check page='about' action='moot' name='<i class="fa fa-ticket fa-fw"></i> Forum' acl=$GLOBAL.acl.moot.forum}
				</ul>
				<!-- /.nav-second-level -->
			</li>
		{/if}
		<li {if $smarty.get.page|default:"0" eq "register" || $smarty.get.page|default:"0" eq "login" || $smarty.get.page|default:"0" eq "logout" || $smarty.get.page|default:"0" eq "tac" || $smarty.get.page|default:"0" eq "contactform"}class="active"{/if}>
			<a href="#"><i class="fa fa-tasks fa-fw"></i> Other<span class="fa arrow"></span></a>
			<ul class="nav nav-second-level">
			  {if $smarty.session.AUTHENTICATED|default:"0" == 1}
			  <li><a href="{$smarty.server.SCRIPT_NAME}?page=logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
			  {else}
			  <li><a href="{$smarty.server.SCRIPT_NAME}?page=login"><i class="fa fa-sign-in fa-fw"></i> Login</a></li>
			  <li><a href="{$smarty.server.SCRIPT_NAME}?page=register"><i class="fa fa-pencil fa-fw"></i> Sign Up</a></li>
			  {/if}
			  {acl_check page='contactform' action='' name='<i class="fa fa-envelope fa-fw"></i> Contact' acl=$GLOBAL.acl.contactform}
			  <li><a href="{$smarty.server.SCRIPT_NAME}?page=tac"><i class="fa fa-book fa-fw"></i> Terms and Conditions</a></li>
			</ul>
			<!-- /.nav-second-level -->
		</li>
	</ul>
</div>
