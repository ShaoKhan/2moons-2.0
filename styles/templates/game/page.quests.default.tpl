{block name="title" prepend}{$LNG.quests_headline}{/block}
{block name="content"}
    <div class="col-lg-12 content_page">
        <div class="row">
            <div><h2 class="buildings_headline">{$LNG.quests_headline}</h2></div>
            <span class="text-center">{$LNG.quests_info}</span>
        </div>
    </div>
    <div class="col-lg-12 content_page system-container">
        {foreach $quests as $data}

            <div class="row mb-4">
                <div class="col-1 quest_options">
{*                    ToDo: send Form and start Quest*}
                    <form name="getQuest" method="post" action="game.php?page=quests&action=startQuest&data={$data.id|base64_encode}">
                        <input type="submit" value="{$LNG.quests_get}" class="btn btn-primary btn-sm" name="getQuest">
                    </form>
                </div>
                <div class="col-1 quest_type">{$data.questtype}</div>
                <div class="col-6 quest_description">{$data.description}</div>
                <div class="col-3 quest_rewards"><div>{$LNG.quests_rewards}: {$data.rewardtype}</div>
                    {foreach $data.rewarddetails as $key => $value}
                        <div>{$value}</div>
                    {/foreach}
                </div>
            </div>
        {/foreach}
    </div>
{/block}