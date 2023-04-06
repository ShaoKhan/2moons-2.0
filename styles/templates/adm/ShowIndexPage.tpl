<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{$adm_cp_title} &bull; {$game_name}</title>
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon">
    <script type="text/javascript">
        if (top.location != self.location) top.location = self.location;
    </script>
</head>

{*
<div class="container">
    <div class="row">
        <div class="col-12">{include_php file="admin.php?page=topnav"}</div>
    </div>
    <div class="row">
        <div class="col-2">{include_php file="admin.php?page=menu"}</div>
        <div class="col-10">{include_php file="admin.php?page=overview"}</div>
    </div>
</div>
*}




<frameset cols="250,*" frameborder="0">
    <frame src="admin.php?page=menu" name="rightFrame" id="rightFrame" noresize="noresize">
    <frameset rows="84,*" frameborder="0">
        <frame src="admin.php?page=topnav" name="topFrame" scrolling="no" noresize="noresize" id="topFrame">
        <frame src="admin.php?page=overview" name="Hauptframe" scrolling="auto" noresize="noresize" id="mainFrame">
    </frameset>
</frameset>
</html>