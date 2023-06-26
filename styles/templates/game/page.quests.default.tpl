{block name="title" prepend}{$LNG.quests_headline}{/block}
{block name="content"}
    <link rel="stylesheet" type="text/css" href="./styles/resource/css/ingame/quest.css">
    <script type="text/javascript" src="./scripts/game/quests.js?v={$smarty.now}"></script>
    <div class="col-lg-12 content_page">
        <div class="row">
            <div><h2 class="buildings_headline">{$LNG.quests_headline}</h2></div>
            <span class="text-center">{$LNG.quests_info}</span>
        </div>
    </div>
    <div class="col-lg-12 content_page system-container">

        {if isset($success)}
            <div class="offset-1 col-10">
                <div class="alert alert-success center" role="alert">
                    {$success}
                </div>
            </div>
        {/if}

        {if isset($smarty.session.error)}
            <div class="offset-1 col-10">
                <div class="alert alert-danger center" role="alert">
                    {$error}
                </div>
            </div>
        {/if}
        {if isset($quests) & count($quests) > 0}

            {foreach $quests as $data}
                <div class="col-12 questcontainer">
                    <div class="row">
                        <div class="col-1 quest_options">
                            <form name="getQuest" method="post" action="game.php?page=quests&action=startQuest">
                                <input type="submit" value="{$LNG.quests_get}" class="btn btn-primary btn-sm"
                                       name="getQuest">
                                <input type="hidden" name="qid" value="{$data.uuid}"/>
                            </form>
                        </div>
                        <div class="col-1">
                            <button data-quest="{$data.uuid}" class="btn_questinfo btn btn-primary btn-sm">
                                {$LNG.quest_btn_info}
                            </button>
                        </div>
                        <div class="col-1 quest_type">{$data.questtype}</div>
                        <div class="col-5 quest_description">{$data.description}</div>
                    </div>
                    <div class="col-12 mt-2 questinfo questinfo_{$data.uuid}">
                        <div class="row">
                            <div class="offset-2 col-1 quest_destination">Ziel: {$data.destination}</div>

                            <div class="col-4 quest_science">
                                {if $data.fleetNeeded|is_array}
                                <div class="row">
                                    <div class="col-6">Benötigte Flotte:</div>
                                    <div class="col-6">
                                        {foreach $data.fleetNeeded as $key2 => $ships}
                                            <div>{$ships}</div>
                                        {/foreach}
                                    </div>
                                </div>
                                {/if}

                                {if $data.scienceNeeded|is_array}
                                <div class="row">
                                    <div class="col-6">Benötigte Forschung:</div>
                                    <div class="col-6">
                                        {foreach $data.scienceNeeded as $key3 => $science}
                                            <div>{$science}</div>
                                        {/foreach}
                                    </div>
                                </div>
                                {/if}
                            </div>

                            <div class="col-4 quest_rewards">
                                <div class="row">
                                    <div class="col-6">{$LNG.quests_rewards}: {$data.rewardtype}</div>
                                    <div class="col-6">
                                        {foreach $data.rewarddetails as $key => $value}
                                            <div>{$value}</div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        {else}
            <div class="row mb-4">
                <div class="col-12">
                    {$LNG.quests_noquests}
                </div>
            </div>
        {/if}
    </div>
{/block}