<p>{$FullName},</p>

<p>Teile on loodud konto süsteemis {$AppTitle} järgmiste andmetega:<br/>
E-post: {$EmailAddress}<br/>
Nimi: {$FullName}<br/>
Telefon: {$Phone}<br/>
Organisatsioon: {$Organization}<br/>
Ametikoht: {$Position}<br/>
Parool: {$Password}</p>
{if !empty($CreatedBy)}
	Looja: {$CreatedBy}
{/if}

<a href="{$ScriptUrl}">Logi sisse süsteemi {$AppTitle}</a>
