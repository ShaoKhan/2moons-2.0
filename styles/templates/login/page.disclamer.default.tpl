{block name="title" prepend}{$LNG.siteTitleDisclamer}{/block}
{block name="content"}
	<div class="container" style="margin-top: 80px;">
		<div class="panel panel-default">
			<div class="panel-heading">{$LNG.siteTitleDisclamer}</div>
			<div class="panel-body">
				<p class="lead">Information</p>
				<p>
					Space-Tactics.com is a free to play Browsegame based on the scripts of 2moons.<br />
					It is still under development since 2021. The progress is visible in the change-logs on the top left corner of the game.<br />
					I am in a full-time job and this is my hobby, so be kind for further updates.<br />
				</p>
				<hr>

				{*<div class="row">
					<address class="col-lg-6">
						<strong>{$LNG.disclamerLabelAddress}</strong><br>
                        {$disclamerAddress}
					</address>
					<address class="col-lg-6">
						<strong>{$LNG.disclamerLabelPhone}</strong><br>
                        {$disclamerPhone}
					</address>
				</div>*}

				<div class="row">
					<address class="col-lg-6">
						<strong>{$LNG.disclamerLabelMail}</strong><br>
						<a href="{$disclamerMail}">{$disclamerMail}</a>
					</address>
					<address class="col-lg-6">
						<strong>{$LNG.disclamerLabelNotice}</strong><br>
						If you are interested in helping me here, contact me via e-mail.<br />
						If you see your rights violated, please contact me as well.<br /><br />
                        {$disclamerNotice}
					</address>
				</div>
			</div>
		</div>
	</div>
{/block}