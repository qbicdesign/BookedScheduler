<p>Te unustasite sisse registreerida.</p>
<p><strong>Broneeringu andmed:</strong></p>
<p>
	<strong>Algus:</strong> {formatdate date=$StartDate key=reservation_email}<br/>
	<strong>Lõpp:</strong> {formatdate date=$EndDate key=reservation_email}<br/>
	<strong>Ressurss:</strong> {$ResourceName}<br/>
	<strong>Pealkiri:</strong> {$Title}<br/>
	<strong>Kirjeldus:</strong> {$Description|nl2br}
</p>

{if $IsAutoRelease}
	<p>Kui Te sisse ei registreeri, tühistatakse see broneering automaatselt kell {formatdate date=$AutoReleaseTime key=reservation_email}</p>
{/if}

<p>
	<a href="{$ScriptUrl}/{$ReservationUrl}">Vaata seda broneeringut</a> |
	<a href="{$ScriptUrl}">Logi sisse süsteemi {$AppTitle}</a>
</p>
