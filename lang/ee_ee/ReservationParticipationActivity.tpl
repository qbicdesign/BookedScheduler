<p>{$ParticipantDetails} on
    {if ($InvitationAction == InvitationAction::Decline || $InvitationAction == InvitationAction::CancelAll || $InvitationAction == InvitationAction::CancelInstance)}
		Teie broneeringukutse tagasi lükanud.
    {elseif ($InvitationAction == InvitationAction::Join || $InvitationAction == InvitationAction::JoinAll)}
		Teie broneeringuga liitunud.
    {else}
		Teie broneeringukutse vastu võtnud.
    {/if}
</p>
<p><strong>Broneeringu andmed:</strong></p>

<p>
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
		<strong>Ressursid ({$ResourceNames|default:array()|count}):</strong>
		<br/>
        {foreach from=$ResourceNames item=resourceName}
            {$resourceName}
			<br/>
        {/foreach}
    {else}
		<strong>Ressurss:</strong>
        {$ResourceName}
		<br/>
    {/if}
</p>

{if $ResourceImage}
	<div class="resource-image"><img alt="{$ResourceName|escape}" src="{$ScriptUrl}/{$ResourceImage}"/></div>
{/if}

<p><strong>Viitenumber:</strong> {$ReferenceNumber}</p>

<p>
	<a href="{$ScriptUrl}/{$ReservationUrl}">Vaata seda broneeringut</a> |
	<a href="{$ScriptUrl}">Logi sisse süsteemi {$AppTitle}</a>
</p>
