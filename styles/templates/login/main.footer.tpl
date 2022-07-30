<div class="footer col-12">
	<div class="container">
    <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>© 2022 {$gameName}</p>
    </footer>
	</div>
</div>
<div id="dialog" style="display:none;"></div>

<script>
    var LoginConfig = {
        'isMultiUniverse': {$isMultiUniverse|json},
        'unisWildcast': {$unisWildcast|json},
        'referralEnable': {$referralEnable|json},
        'basePath': {$basepath|json}
    };
</script>

</body>
</html>