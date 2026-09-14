<p>Teie broneering on peagi lõppemas.</p>
<p><strong>Broneeringu andmed:</strong></p>

<p>
	<strong>Algus:</strong> {formatdate date=$StartDate key=reservation_email}<br/>
	<strong>Lõpp:</strong> {formatdate date=$EndDate key=reservation_email}<br/>
	<strong>Ressurss:</strong> {$ResourceName}<br/>
	<strong>Pealkiri:</strong> {$Title}<br/>
	<strong>Kirjeldus:</strong> {$Description|nl2br}
</p>

<p>
	{* Extract the encoded location string out of the GoogleCalendarUrl *}
	{assign var="extractedLocation" value=$GoogleCalendarUrl|regex_replace:'/.*&location=([^&]+).*/':'$1'}

	{* Build custom subject: Broneering: [Room] - [Title] *}
	{if $Title}
		{assign var="fullSubject" value="Broneering: "|cat:$extractedLocation|string_format:"%s - `$Title`"}
	{else}
		{assign var="fullSubject" value="Broneering: "|cat:$extractedLocation}
	{/if}
	<a href="{$ScriptUrl}/{$ReservationUrl}">Vaata seda broneeringut</a> |
	<a href="{$ScriptUrl}/{$ICalUrl}">Lisa kalendrisse</a> |
	|
	<a href="https://outlook.office.com/calendar/deeplink/compose?path=/calendar/action/compose&rru=addevent&startdt={$StartDate|date_format:'%Y-%m-%dT%H:%M:%S'}&enddt={$EndDate|date_format:'%Y-%m-%dT%H:%M:%S'}&subject=Broneering%3A%20{if $Title}{$Title|urlencode}{else}{$ResourceName|urlencode}{/if}%20({$ResourceName|urlencode})&location={$ResourceName|urlencode}" target="_blank">Lisa Outlooki kalendrisse</a>
	|
	<a href="{$GoogleCalendarUrl}" target="_blank" rel="nofollow">Lisa Google'i kalendrisse</a>
	|
	<a href="{$ScriptUrl}">Logi sisse süsteemi {$AppTitle}</a>
</p>
