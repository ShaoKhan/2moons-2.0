{block name="title" prepend}{$LNG.siteTitleRules}{/block}
{block name="content"}
    <div class="container mt-4">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><h2>{$LNG.siteTitleRules}</h2></div>
                    {$rules}
                </div>
            </div>
        </div>
    </div>
{/block}