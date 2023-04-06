{include file="overall_header.tpl"}
<center>
	<h1>{$LNG.ow_title}</h1>
	<table width="90%" style="border:2px {if empty($Messages)}lime{else}red{/if} solid;text-align:center;font-weight:bold;">
		<tr>
			<td class="transparent">{foreach item=Message from=$Messages}
					<span style="color:red">{$Message}</span><br>
					{foreachelse}{$LNG.ow_none}{/foreach}
			</td>
		</tr>
	</table>
	<br>
	<table width="80%">
		<tr>
			<th colspan="2">{$LNG.ow_overview}</th>
		</tr>
		<tr>
			<td style="height:50px" colspan="2">{$LNG.ow_welcome_text}</td>
		</tr>
		<tr>
			<th colspan="2">{$LNG.ow_support}</th>
		</tr>
		<tr>
			<td colspan="2"><a href="https://Space-Tactics.com/" target="_blank">Space-Tactics</a>
		</tr>
		<tr>
			<th colspan="2">{$LNG.ow_updates}</th>
		</tr>
		<tr>
			<td>{$lastModifiedFile}</td>
		</tr>
		<tr>
			<th colspan="2">{$LNG.ow_credits}</th>
		</tr>
		<tr>
			<td colspan="2">
				<table align="center">
					<tr>
						<td class="transparent" colspan="3"><h3>{$LNG.ow_proyect_leader}</h3></td>
					</tr>
					<tr>
						<td class="transparent" colspan="3"><h3><a target="_blank" href="https://Space-Tactics.com" style="color:red">ShaoKhan</a></h3></td>
					</tr>
				</table>
				<div style="width:100%">
					<div style="float:left;width:50%;min-width:250px;">
						<table>
							<tr>
								<td class="transparent"><p>&nbsp;</p><h3>{$LNG.ow_translator}</h3></td>
							</tr>
							<tr>
								<td class="transparent">
									<table width="250px;">
										<tr>
											<td>actual none</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div style="float:left;width:50%;min-width:250px;">
						<table>
							<tr>
								<td class="transparent"><p>&nbsp;</p><h3>{$LNG.ow_special_thanks}</h3></td>
							</tr>
							<tr>
								<td class="transparent">
									<table width="250px;">
										<tr>
											<td class="transparent left">RumbleStilzchen</td>
											<td class="transparent left">ZockerEde</td>
											<td class="transparent left">Aeden</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</td>
		</tr>
	</table>
</center>
{*<script type="text/javascript" src="https://www.google.com/jsapi"></script>*}
{*<script type="text/javascript">*}
{*	google.load("feeds", "1");*}
{*	google.setOnLoadCallback(initialize);*}
{*	function initialize() {*}
{*		var feedControl = new google.feeds.FeedControl();*}
{*		feedControl.addFeed("https://github.com/jkroepke/2Moons/commits/master.atom", "");*}
{*		//feedControl.addFeed("http://code.google.com/feeds/p/2moons/svnchanges/basic", "");*}
{*		feedControl.draw(document.getElementById("feed"));*}
{*		//var feedControl = new google.feeds.FeedControl();*}
{*        //feedControl.addFeed("https://www.facebook.com/feeds/page.php?id=129282307106646&format=rss20", "");*}
{*        //feedControl.draw(document.getElementById("news"));*}
{*	}*}
{*</script>*}
{include file="overall_footer.tpl"}