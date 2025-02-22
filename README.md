# How to use

### Generate/Renew certificate with Let's encrypt (Example)

- Stop your nginx or apache webserver with `systemctl stop nginx`/`/etc/init.d/apache2 stop`
- Generate your certificate with `certbot certonly --webroot-path WebApplication/ -d example.org --standalone`
- `cp -r -L /etc/letsencrypt/live/example.org/fullchain.pem /etc/letsencrypt/ssl`
- `cp -r -L /etc/letsencrypt/live/example.org/privkey.pem /etc/letsencrypt/ssl`
- Navigate to path `/etc/letsencrypt`
- `openssl pkcs12 -export -out certificate.pfx -inkey ssl/privkey.pem -in ssl/fullchain.pem`
- The password must be used in the `Dockerfile` variable `httpsKeyStorePassword`
- Now convert the private key: `cp privkey.pem https.key`
- Copy the `https.key` and `certificate.pfx` files into your Jenkins Docker directory

### Starting your Jenkins

Once you have created the certificate files with the required extension
and copied them to the project's Docker files directory, you can start
the Jenkins server using `docker compose up` or `docker compose -d` with detached terminal.