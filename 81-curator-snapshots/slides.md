%title: ELK
%author: xavki


# ElasticSearch Curator - Snapshots


<br>


* installation serveur nfs

```
sudo apt-get install nfs-kernel-server
sudo mkdir -p /srv/bck
sudo chmod 775 /srv/bck/
```

```
vim /etc/exports
/srv/bck 192.168.20.0/24(rw,sync,no_root_squash)
exportfs -r
```

* check sur les clients

``` 
sudo apt install nfs-client
sudo mount -t nfs 192.168.20.104:/srv/bck /tmp
sudo umount /tmp
```

* préparation du répertoire (clients)

```
sudo mkdir -p /exports/backup
sudo chown elasticsearch:elasticsearch /exports/backup
```

* montage sur les clients

```
/etc/fstab
192.168.20.104:/srv/bck /exports/backup nfs defaults 0 0
sudo mount -a
```

* on recheck les droits pour elasticsearch

```
sudo chown elasticsearch:elasticsearch /exports/backup
```

<br>


* création du repo sur elasticsearch.yml sur tous les noeuds

```
path.repo: ["/exports/backup"]
sudo systemctl restart elasticsearch
```

* puis création du repo

```
curl -XPUT '192.168.20.102:9200/_snapshot/cur_backup' -H 'Content-Type: application/json' -d '{ "type": "fs", "settings": {"location": "/exports/backup","compress": true}}'
```

<br>


UTILISATION DE CURATOR

* snapshot curator :

```
actions:
  1:
    action: snapshot
    description: snap communes
    options:
      repository: cur_backup
      name: bck-communes-%Y%m%d%H%M%S
      ignore_unavailable: False
      include_global_state: True
      partial: False
      wait_for_completion: True
      skip_repo_fs_check: False
      disable_action: False
    filters:
    - filtertype: pattern
      kind: prefix
      value: communes
    - filtertype: age
      source: creation_date
      direction: younger
      unit: days
      unit_count: 1
```

<br>


* ajout restauration dans la foulée

```
  2:
    action: restore
    description: restoration
    options:
      repository: cur_backup
      # If name is blank, the most recent snapshot by age will be selected
      name: 
      # If indices is blank, all indices in the snapshot will be restored
      indices:
      include_aliases: False
      ignore_unavailable: False
      include_global_state: False
      partial: False
      rename_pattern: '(.+)'
      rename_replacement: 'restored_$1'
      extra_settings:
      wait_for_completion: True
      skip_repo_fs_check: True
      disable_action: False
    filters:
    - filtertype: pattern
      kind: prefix
      value: bck-communes
    - filtertype: state
      state: SUCCESS
```
