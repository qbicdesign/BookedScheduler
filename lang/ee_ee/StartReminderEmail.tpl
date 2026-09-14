<p>Teie broneering on peagi algamas.</p>
<p><strong>Broneeringu andmed:</strong></p>
<p>
	<strong>Algus:</strong> {formatdate date=$StartDate key=reservation_email}<br/>
	<strong>Lõpp:</strong> {formatdate date=$EndDate key=reservation_email}<br/>
	<strong>Ressurss:</strong> {$ResourceName}<br/>
	<strong>Pealkiri:</strong> {$Title}<br/>
	<strong>Kirjeldus:</strong> {$Description|nl2br}
</p>

<p>
	<a href="{$ScriptUrl}/{$ReservationUrl}">Vaata seda broneeringut</a> |
	<a href="{$ScriptUrl}/{$ICalUrl}">Lisa kalendrisse</a> |
	<a href="{$ScriptUrl}">Logi sisse süsteemi {$AppTitle}</a>
</p>
