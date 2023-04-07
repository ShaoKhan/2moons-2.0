{block name="title" prepend}{$LNG.siteTitleDisclamer}{/block}
{block name="content"}
	<div class="container" style="margin-top: 80px;">
		<div class="panel panel-default">
			<div class="panel-heading">{$LNG.siteTitleDisclamer}</div>
			<div class="panel-body">
				<p class="lead">Information</p>
				<p>The contact page will change the following with a contact form so that your player can send you mail in case of problem connecting your game.</p>

				<hr>

				<div class="row">
					<address class="col-lg-6">
						<strong>{$LNG.disclamerLabelAddress}</strong><br>
                        {$disclamerAddress}
					</address>
					<address class="col-lg-6">
						<strong>{$LNG.disclamerLabelPhone}</strong><br>
                        {$disclamerPhone}
					</address>
				</div>

				<div class="row">
					<address class="col-lg-6">
						<strong>{$LNG.disclamerLabelMail}</strong><br>
						<a href="{$disclamerMail}">{$disclamerMail}</a>
					</address>
					<address class="col-lg-6">
						<strong>{$LNG.disclamerLabelNotice}</strong><br>
                        {$disclamerNotice}
					</address>
				</div>

				<div class="row">
					<ul>
						<li>Index-Video: <a href="https://www.vecteezy.com/video/2158564-3-d-animated-footage-of-planet-mars">3 D Animated Footage of Planet Mars Stock Videos by Vecteezy</a></li>
						<li>InGameBackground-Video: Video by <a href="https://pixabay.com/users/mikkehouse-3374228/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=video&amp;utm_content=25047">mike lacoste</a> from <a href="https://pixabay.com//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=video&amp;utm_content=25047">Pixabay</a></li>
					</ul>

				</div>

			</div>
		</div>
	</div>
{/block}