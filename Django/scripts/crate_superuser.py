#!/bin/pyhton3
from django.core.management import setup_environ
import settings
setup_environ(settings)

from django.contrib.auth.models import User

u = User(username='unique_fellow')
u.set_password('a_very_cryptic_password')
u.is_superuser = True
u.is_staff = True
u.save()
