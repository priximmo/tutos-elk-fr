%title: ELK
%author: xavki


# LOGSTASH : FILTERS - MUTATE


<br>


* mutate = modification/ajout variée et manipulation de ligne reçue

<br>


Liste des blocs possibles : 
	* coerce : valeur par défaut
	* rename : changer le nom d'un champs
	* update
	* replace : modifie le contenu y compris avec les variables
	* convert : modifie le type de champs (integer...)
	* gsub : remplace, regex...
	* uppercase : passer en majuscule
	* capitalize
	* lowercase : passer en minuscule
	* strip
	* remove
	* split : split un champs dans un tableau
	* join : fusionne un tableau dans un champs
	* merge : ajoute un champs à un autre dans un tableau
	* copy : recopie un élément dans un champs

--------------------------------------------------------------------

# LOGSTASH : FILTERS - MUTATE


<br>


12/01/2019;poster une vidéo ? - ou quoi ?;xavki.com;XAVKI;1;2;;changement de nom;replace

<br>


```
filter {
  csv {
    columns => ["mydate", "action", "split","minuscule","merge1","merge2","coerce","rename","replace"]
    separator => ";"
  }
  date {
    match => [ "mydate", "dd/MM/yyyy" ]
  }
  mutate {
    copy => { "[@timestamp]" => "mydate" }
    gsub => ["action", "[?-]", ""]
    split => { "split" => "." }
    lowercase => [ "minuscule" ]
    merge => { "merge1" => "merge2" }
    coerce => { "coerce" => "default_value" }
    rename => { "rename" => "apres_rename" }
    replace => { "replace" => "%{host}" }
  }
}
```
