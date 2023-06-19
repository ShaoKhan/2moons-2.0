{block name="title" prepend}{$LNG.quests_headline}{/block}
{block name="content"}
    <div class="col-lg-12 content_page">
        <div class="row">
            <div><h2 class="buildings_headline">{$LNG.quests_headline}</h2></div>
            <span class="text-center">{$LNG.quests_info}</span>
        </div>
    </div>
    <div class="col-lg-12 content_page system-container">

        {foreach $quests as $quest}
            <div class="row">
                <div class="col-2 quest_type">{$quest.type}</div>
                <div class="col-6 quest_description">{$quest.description}</div>
                <div class="col-3 quest_rewards">
{*                    ToDo: Es kommt kein 2. Array bei den Rewards an*}
                    {foreach from=$quest.reward_details  key=k item=rewards}
                        <div class="row">
                            {$LNG.$k}: {$rewards}
                        </div>
                    {/foreach}

                </div>
                <div class="col-1 quest_options">

                </div>
            </div>
        {/foreach}
    </div>
{/block}