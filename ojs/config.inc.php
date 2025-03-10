; <?php exit(); // DO NOT DELETE ?>
; config.inc.php
; OJS Configuration file

[database]
driver = mysqli
host = "{$OJS_DB_HOST}"
username = "{$OJS_DB_USER}"
password = "{$OJS_DB_PASSWORD}"
name = "{$OJS_DB_NAME}"

[general]
installed = Off
base_url = "http://{$SERVERNAME}"
session_lifetime = 30
session_cookie_name = OJSSID
session_check_ip = Off
session_check_user_agent = Off
scheduled_tasks = On

[cache]
cache = file
memcache_hostname = localhost
memcache_port = 11211
file_cache_path = cache
object_cache_lifetime = 86400
page_cache = On
page_cache_lifetime = 86400

[security]
force_ssl = Off
force_login_ssl = Off
session_check_ip = Off
encryption = sha1
allowed_html = "<a><b><blockquote><br><caption><cite><code><dd><div><dl><dt><em><h1><h2><h3><h4><h5><h6><hr><i><img><li><ol><p><pre><s><small><span><strike><strong><sub><sup><table><tbody><td><th><thead><tr><tt><u><ul>"

[email]
smtp = On
smtp_server = localhost
smtp_port = 25
smtp_auth = Off
smtp_username = ""
smtp_password = ""
envelope_sender = null
allow_envelope_sender = Off
force_default_envelope_sender = Off
default_envelope_sender = null
force_dmarc_compliant_from = Off
disable_recipient_envelope = Off
time_between_emails = 3600
min_time_between_emails = 300
max_recipients = 10
confirmation = On

[i18n]
locale = en_US
client_charset = utf-8
connection_charset = utf8
database_charset = utf8

[files]
files_dir = files
public_files_dir = public
umask = 0022
file_permissions = 0644
dir_permissions = 0755
gzip = Off