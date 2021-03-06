<li
    id="{$contact->jid|cleanupId}"
    title="{$contact->jid}{if="$contact->presence"} - {$contact->presence->presencetext}{/if}"
    name="{$contact->getSearchTerms()}"
    class="block"
    onclick="
        MovimUtils.redirect('{$c->route('contact', $contact->jid)}')
    ">
    {$url = $contact->getPhoto('s')}
    {if="$url"}
        <span class="primary icon bubble
            {if="!$contact->presence || $contact->presence->value > 4"}
                disabled
            {else}
                status {$contact->presence->presencekey}
            {/if}"
            style="background-image: url({$url});">
            <span data-key="chat|{$contact->jid}" class="counter"></span>
        </span>
    {else}
        <span class="primary icon bubble color {$contact->jid|stringToColor}
            {if="!$contact->presence || $contact->presence->value > 4"}
                disabled
            {else}
                status {$contact->presence->presencekey}
            {/if}
        ">
            {$contact->truename|firstLetterCapitalize}
            <span data-key="chat|{$contact->jid}" class="counter"></span>
        </span>
    {/if}
    {if="$contact->subscription != 'both'"}
    <span class="control icon gray">
        {if="$contact->subscription == 'to'"}
            <i class="material-icons">arrow_upward</i>
        {elseif="$contact->subscription == 'from'"}
            <i class="material-icons">arrow_downward</i>
        {else}
            <i class="material-icons">block</i>
        {/if}
    </span>
    {/if}
    <p class="normal line">
        {$contact->truename}
        {if="$contact->presence && $contact->presence->capability"}
            <span class="second" title="{$contact->presence->capability->name}">
                <i class="material-icons">{$contact->presence->capability->getDeviceIcon()}</i>
            </span>
        {/if}
    </p>
    {if="$contact->group"}
    <p class="line">
        <span class="tag color {$contact->group|stringToColor}">
            {$contact->group}
        </span>
    </p>
    {/if}
</li>
