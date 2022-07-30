{block name="title" prepend}{$LNG.siteTitleNews}{/block}
{block name="content"}
    <div class="container" style="margin-top: 80px;">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><h2>{$LNG.siteTitleNews}</h2></div>
                    {foreach $newsList as $newsRow}
                        <div class="panel-body">
                            <h4 class="page-header">{$newsRow.title}</h4>
                            <div class="info">{$newsRow.from}</div>
                            <p>{$newsRow.text}</p>
                        </div>
                        {foreachelse}
                        <div class="panel-body">
                            <h4 class="page-header">{$LNG.news_does_not_exist}</h4>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
{/block}