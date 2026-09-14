{if $Deleted}
    <p>{$UserName} tühistas broneeringu</p>
    {else}
    <p>{$UserName} lisas Teid broneeringule</p>
{/if}

{if !empty($DeleteReason)}
    <p><strong>Kustutamise põhjus:</strong> {$DeleteReason|nl2br}</p>
{/if}

<p><strong>Broneeringu andmed:</strong></p>

<p>
    <strong>Algus:</strong> {formatdate date=$StartDate key=reservation_email}<br/>
    <strong>Lõpp:</strong> {formatdate date=$EndDate key=reservation_email}<br/>
</p>

<p>
{if $ResourceNames|default:array()|count > 1}
    <strong>Ressursid ({$ResourceNames|default:array()|count}):</strong> <br />
    {foreach from=$ResourceNames item=resourceName}
        {$resourceName}<br/>
    {/foreach}
{else}
    <strong>Ressurss:</strong> {$ResourceName}<br/>
{/if}
</p>

{if $ResourceImage}
    <div class="resource-image"><img alt="{$ResourceName|escape}" src="{$ScriptUrl}/{$ResourceImage}"/></div>
{/if}

{if $RequiresApproval && !$Deleted}
    <p>* Vähemalt üks broneeritud ressurssidest vajab enne kasutamist kinnitamist. See broneering on ootel kuni kinnitamiseni. *</p>
{/if}

<p>
    <strong>Pealkiri:</strong> {$Title}<br/>
    <strong>Kirjeldus:</strong> {$Description|nl2br}
</p>

{if count($RepeatRanges) gt 0}
    <br/>
    <strong>Broneering toimub järgmistel kuupäevadel ({$RepeatRanges|default:array()|count}):</strong>
    <br/>
{/if}

{foreach from=$RepeatRanges item=date name=dates}
    {formatdate date=$date->GetBegin()}
    {if !$date->IsSameDate()} - {formatdate date=$date->GetEnd()}{/if}
    <br/>
{/foreach}

{if $Participants|default:array()|count >0}
    <br />
    <strong>Osalejad ({$Participants|default:array()|count + $ParticipatingGuests|default:array()|count}):</strong>
    <br />
    {foreach from=$Participants item=user}
        {$user->FullName()}
        <br/>
    {/foreach}
{/if}

{if $ParticipatingGuests|default:array()|count >0}
    {foreach from=$ParticipatingGuests item=email}
        {$email}
        <br/>
    {/foreach}
{/if}

{if $Invitees|default:array()|count >0}
    <br />
    <strong>Kutsutud ({$Invitees|default:array()|count + $InvitedGuests|default:array()|count}):</strong>
    <br />
    {foreach from=$Invitees item=user}
        {$user->FullName()}
        <br/>
    {/foreach}
{/if}

{if $InvitedGuests|default:array()|count >0}
    {foreach from=$InvitedGuests item=email}
        {$email}
        <br/>
    {/foreach}
{/if}

{if $Accessories|default:array()|count > 0}
    <br />
       <strong>Lisavahendid ({$Accessories|default:array()|count}):</strong>
       <br />
    {foreach from=$Accessories item=accessory}
        ({$accessory->QuantityReserved}) {$accessory->Name}
        <br/>
    {/foreach}
{/if}

{if !$Deleted && !$Updated}
<p>
    <strong>Osalete?</strong> <a href="{$ScriptUrl}/{$AcceptUrl}">Jah</a> <a href="{$ScriptUrl}/{$DeclineUrl}">Ei</a>
</p>
{/if}

{if !$Deleted}
<a href="{$ScriptUrl}/{$ReservationUrl}">Vaata seda broneeringut</a> |
<a href="{$ScriptUrl}/{$ICalUrl}">Lisa kalendrisse</a> |
<a href="{$GoogleCalendarUrl}" target="_blank" rel="nofollow">Lisa Google'i kalendrisse</a> |
{/if}
<a href="{$ScriptUrl}">Logi sisse süsteemi {$AppTitle}</a>
