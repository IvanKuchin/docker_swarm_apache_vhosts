<VirtualHost *:80>
ServerName www.timecard.ru
<Proxy *>
Allow from localhost
</Proxy>
ProxyPass / http://vhost3/
</VirtualHost>

<VirtualHost *:443>
	ServerName www.timecard.ru
	<Proxy *>
		Allow from localhost
	</Proxy>

	ProxyPass / http://vhost3/

        <IfModule mod_ssl.c>
            SSLProxyEngine on
            SSLEngine on
            SSLCertificateKeyFile /etc/ssl/private/www.timecard.ru.key
            SSLCertificateFile /etc/ssl/certs/www.timecard.ru.crt
            SSLCertificateChainFile /etc/ssl/certs/www.timecard.ru.ca-bundle
        </IfModule>

	CustomLog /var/log/apache2/www.timecard.ru.log combined
</VirtualHost>
