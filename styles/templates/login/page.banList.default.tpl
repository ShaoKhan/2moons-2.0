{block name="title" prepend}{$LNG.siteTitleBanList}{/block}
{block name="content"}
	<div class="container mt-4">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading"><h2>{$LNG.bn_players_banned_list}</h2></div>
                    {if $isMultiUniverse}<p>{html_options options=$universeSelect selected=$UNI class="form-control changeUni" id="universe" name="universe"}</p>{/if}

					<div class="row">
						<div class="col-2">{$LNG.bn_from}</div>
						<div class="col-2">{$LNG.bn_until}</div>
						<div class="col-2">{$LNG.bn_player}</div>
						<div class="col-2">{$LNG.bn_by}</div>
						<div class="col-4">{$LNG.bn_reason}</div>
					</div>

					{if $banCount}
						{foreach $banList as $banRow}
							<div class="row">
								<div class="col-2">{$banRow.from}</div>
								<div class="col-2">{$banRow.to}</div>
								<div class="col-2">{$banRow.player}</div>
								<div class="col-2"><a href="mailto:{$banRow.mail}" title="{$banRow.info}">{$banRow.admin}</a></div>
								<div class="col-4">{$banRow.theme}</div>
							</div>
						{/foreach}
						<div class="row">
							<div class="col-12">{$LNG.bn_exists}{$banCount|number}{$LNG.bn_players_banned}</div>
						</div>
					{else}
						<div class="row">
							<div class="col-12">{$LNG.bn_no_players_banned}</div>
						</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
{/block}