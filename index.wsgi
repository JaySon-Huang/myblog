import sys
import os.path
  
os.environ['DJANGO_SETTINGS_MODULE'] = 'jsite.settings'
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'jsite'))
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'site-packages'))
  
import sae
from jsite import wsgi
application = sae.create_wsgi_app(wsgi.application)
