<p><strong>Broneeringu andmed:</strong></p>

<p>
	<strong>Kasutaja:</strong> {$UserName}<br/>
    {if !empty($CreatedBy)}
		<strong>Looja:</strong>
        {$CreatedBy}
		<br/>
    {/if}
	<strong>Algus:</strong> {formatdate date=$StartDate key=reservation_email}<br/>
	<strong>Lõpp:</strong> {formatdate date=$EndDate key=reservation_email}<br/>
	<strong>Pealkiri:</strong> {$Title}<br/>
	<strong>Kirjeldus:</strong> {$Description|nl2br}
    {if $Attributes|default:array()|count > 0}
	<br/>
    {foreach from=$Attributes item=attribute}
	<div>{control type="AttributeControl" attribute=$attribute readonly=true}</div>
    {/foreach}
{/if}
</p>

<p>
    {if $ResourceNames|default:array()|count > 1}
		<strong>Ressursid:</strong>
		<br/>
        {foreach from=$ResourceNames item=resourceName}
            {$resourceName}
			<br/>
        {/foreach}
    {else}
		<strong>Ressurss:</strong>
        {$ResourceName}
    {/if}
</p>

{if $ResourceImage}
	<div class="resource-image"><img alt="{$ResourceName}" src="{$ScriptUrl}/{$ResourceImage}"/></div>
{/if}


{if $RequiresApproval}
	<p>* Vähemalt üks broneeritud ressurssidest vajab enne kasutamist kinnitamist. Palun veenduge, et see broneeringupäring kinnitatakse või lükatakse tagasi. *</p>
{/if}

{if $CheckInEnabled}
	<p>
		Vähemalt üks broneeritud ressurssidest nõuab, et kasutaja registreeriks sisse ja välja.
        {if $AutoReleaseMinutes != null}
			See broneering tühistatakse, kui kasutaja ei registreeri sisse {$AutoReleaseMinutes} minuti jooksul pärast kavandatud algusaega.
        {/if}
	</p>
{/if}

{if count($RepeatRanges) gt 0}
	<p>
		Broneering toimub järgmistel kuupäevadel ({$RepeatRanges|default:array()|count}):
		<br/>
        {foreach from=$RepeatRanges item=date name=dates}
            {formatdate date=$date->GetBegin()}
            {if !$date->IsSameDate()} - {formatdate date=$date->GetEnd()}{/if}
			<br/>
        {/foreach}
	</p>
{/if}

{if $Participants|default:array()|count >0}
	<br/>
	<strong>Osalejad ({$Participants|default:array()|count + $ParticipatingGuests|default:array()|count}):</strong>
	<br/>
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
	<br/>
	<strong>Kutsutud ({$Invitees|default:array()|count + $InvitedGuests|default:array()|count}):</strong>
	<br/>
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
	<br/>
	<strong>Lisavahendid ({$Accessories|default:array()|count}):</strong>
	<br/>
    {foreach from=$Accessories item=accessory}
		({$accessory->QuantityReserved}) {$accessory->Name}
		<br/>
    {/foreach}
{/if}

<p><strong>Viitenumber:</strong> {$ReferenceNumber}</p>

<p>
    <a href="{$ScriptUrl}/{$ReservationUrl}">Vaata seda broneeringut</a> | <a href="{$ScriptUrl}">Logi sisse süsteemi {$AppTitle}</a>
</p>

{if !$Deleted}
	<a href="{$ScriptUrl}/{$ReservationUrl}">Vaata seda broneeringut</a>
	|
	<a href="{$GoogleCalendarUrl}" target="_blank" rel="nofollow">Lisa Google'i kalendrisse</a>
	|
{/if}
