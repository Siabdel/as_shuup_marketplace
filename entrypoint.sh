#!/bin/sh
#source .env.dev
#vider la base
python3 ./manage.py flush --no-input

 
# install requirements
pip3 install -r ./requirements.txt
## migration models en base
python3 ./manage.py migrate


# init data essentials
python manage.py shuup_init
# collecter les fichiers static
# python3 ./manage.py collectstatic --no-input
## creation du superuser abdel et admin
echo "from django.contrib.auth.models import User; User.objects.create_superuser(username='admin', password='grutil001', email='admin@atlass.fr')" | python3 manage.py shell
echo "from django.contrib.auth.models import User; User.objects.create_superuser(username='abdel', password='grutil001', email='abdel@atlass.fr')" | python3 manage.py shell

#python3 manage.py createsuperuser --noinput --username admin --email 'admin@atlass.com'
## demarage du serveur django
python3 ./manage.py runserver 0.0.0.0:8000