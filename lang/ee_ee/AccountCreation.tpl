<p>{$To},</p>

<p>Uus kasutaja on registreerunud järgmiste andmetega:<br/>
E-post: {$EmailAddress}<br/>
Nimi: {$FullName}<br/>
Telefon: {$Phone}<br/>
Organisatsioon: {$Organization}<br/>
Ametukoht: {$Position}</p>
{if !empty($CreatedBy)}
	Looja: {$CreatedBy}
{/if}
