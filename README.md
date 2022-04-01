# as_shuup_marketplace
as django shuup ecommerce est un E-commerce open source avec Shuup.
Facile à utiliser, à personnaliser et à faire évoluer. 
Il est fiable et convivial, utilise des normes communes qui favoriseront votre présence sur le Web et sur mobile. 
Shuup a été construit sur le puissant framework Web Django

## 1. Installation SHUUP sur debian 11 "bullseye"



### virtualenv envDjangoShuup



```shell
$ mkvirtualenvs envDjangoShuup
$ workon envDjangoShuup
$ cdvirtualenv envDjangoShuup
```



### install Shuup



```shell
$ pip install -U pip
$ pip install shuup

```



### fichier config 'settings.py' et 'urls.py'

copier la config de cette référence : 

* ici  [settings](https://github.com/shuup/shuup/blob/master/shuup_workbench/settings/base_settings.py) and [urls](https://github.com/shuup/shuup/blob/master/shuup_workbench/urls.py) for configuration details 

### Migrations 

```shell
$ python manage.py migrate
$ python manage.py shuup_init
```

