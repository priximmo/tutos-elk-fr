%title: ELK
%author: xavki


# LOGSTASH : FILTERS - EX : CSV


<br>


* Logstash = Extract Transfert Load (ETL)

* processer de la données (manipuler...)

<br>


* configuration :
		* input/filter/output
		* milieu de pipeline pour travailler la data

<br>


* filters
		* parser les éléments (une ligne >> extraire des champs)
		* conversion : champs > date ou taille > chiffres
		* vérification d'IP
		* répliquer des évènements
		* utilisation de délimiteurs ou non
		* lookup dns
		* calcule de temps
		* géolocalisation
		* enrichissement de datas via d'autres source
		* parsing connus : csv, json, k/v, xml...
		* aggrégation
		* modification

------------------------------------------------------------------------------

# LOGSTASH : FILTERS

<br>


EXEMPLE CSV

```
filter {
	csv {
	}
}
```

<br>


* options :
		* columns : définition des entêtes
		* delimiter : délimitation des champs (défaut ",")
		* convert : converti le format des champs
		* remove_field : suppression d'un champs (message) ou des champs non utilisés

