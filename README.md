# LAMP Chart



## Chart Values Documentation

### Web Server Values
| Value | Description |
| ----- | ----------- |
| lamp.image | The image to run on the web deployment. (Default: `php:7.3-apache`)
| lamp.replicas | How many replicas in the deployment? (Default: `1`)
| lamp.ingressUrl | Provide the lamp deployment with knowledge about what its public URL is via `LAMP_INGRESS_URL`. This overrides the `ingress.hosts[0]` which is used if this isn't set. (Default: `"ingress.hosts[0]"`)
| lamp.startupScript | A snippet of bash script to run before starting the web server. (Default: `""`)
| lamp.annotations | Annotations to add to every type of resource created for the lamp component. (Default: ~)
| lamp.ingressAnnotations | Annotations to add to the ingress record specifically.
### Database Values
| Value | Description |
| ----- | ----------- |
| database.enabled | Enables the database StatefulSet. (Default: `false`)
| database.image | Use a specific database image in the StatefulSet. (Default: `mysql:5`)
| database.rootPassword | Choose a specific root password for mysql. (Default: `rootpw`)
| database.userName | Choose a username for a less privileged mysql user. (Default: `lamp`)
| database.userPassword | Choose a password for the less privileged mysql user. (Default: `changeme`)
| database.tinyConfiguration | Enable tiny configuration mode which starts mysql with minimum settings. (Default: `""`)
| database.persistence.storageClass | Use a specific storage class for the mysql stateful set's pvc template. (Default: `""`)
| database.annotations | Set annotations on all database-related resources. (Default: `~`)
| database.secretAnnotations | Set annotations on the mysql-secret resource. (Default: `~`)
### Web Ingress Values
| Value | Description |
| ----- | ----------- |
| ingress.hosts | A list of host names that the ingress will route to the web server. The first host name listed will be the default host name in case we redirect. If leave hosts as an empty array, the ingress resource will not be created. The default host (`ingress.hosts[0]`) will be provided to the deployment through `LAMP_INGRESS_URL`  with a leading `https://` or `http://` depending on whether TLS is enabled. (Default: `[]`)
| ingress.tls.enabled | Enables TLS support for the ingress. TLS references a secret called `lamp-cert`. (Default: `false`)
| ingress.tls.certManager.clusterIssuer | Adds the cert-manager clusterIssuer annotations so that cert-manager can issue a certificate for this ingress and store it in the `lamp-cert` secret. (Default: `""`)
| ingress.tls.certManager.issuer | Adds the cert-manager issuer annotations so that cert-manager can issue a certificate for this ingress and store it in the `lamp-cert` secret. (Default: `""`)
| ingress.nginx.configurationSnippet | Set to a string of arbitrary nginx location configuration. (Default: `""`)
| ingress.modsecurity.enabled | Enables modsecurity for nginx ingress so that modsecurity can be used as a web application firewall. (Default: `false`)
| ingress.modsecurity.owasp | Enables the OWASP core ruleset for the ingress. (Default: `false`)
| ingress.modsecurity.whitelist | Enables a global whitelist so that only certain IP addresses can access the website. Use modsecurity `@ipMatch` syntax. For example: `1.2.3.4/32,5.6.7.8/32,192.168.0.0/16`. (Default: `""`)
| ingress.modsecurity.restrictedUris | Enter a list of restricted urls to apply whitelist restrictions on only a subset of restricted URLs. This is a @beginsWith restriction. For instance: `["/wp-admin", "/wp-login.php"]`. (Default: `[]`)
| ingress.restrictedWhitelist | Set to an `@ipMatch` syntax list of IP addresses allowed to access the `restrictedUris` listed above. (Default: `""`)
### SFTP Values
| Value | Description |
| ----- | ----------- |
| sftp.enabled | Enables sftp support. (Default: `false`)
| sftp.serviceType | Set the service type of the sftp service. (Default: `LoadBalancer`)
| sftp.servicePort | Set the port exposed on the load balancer if applicable. (Default: `1022`)
| sftp.image | Pick an sftp image. (Default: `atmoz/sftp:alpine`)
| sftp.port | Pick the port exposed by `sftp.image` to provide through the load balancer. (Default: `22`)
| sftp.livenessProbe | Define the livenessProbe for sftp. (Default: `~`)
| sftp.username | Username to log in to sftp. (Default: `sftp-user`)
| sftp.password | Password to log in with. (Default: `~` - this will give an error, so you must set it.)
| sftp.hostKey.ed25519 | The unpassworded ed25519 key to provide a consistent SSH host key. Run `ssh-keygen -t ed25519 -f ssh_host_ed25519_key < /dev/null` and copy the contents of the generated file here. (Default: `~`)
| sftp.rsa | The unpassworded rsa key to provide a consistent SSH host key. Run `ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key < /dev/null` and copy the contents of the generated file here. (Default: `~`)
| sftp.annotations | Provide annotations to all sftp resources.
### WebDAV Values Documentation
| Value | Description |
| ----- | ----------- |
| webdav.enabled | Enables WebDAV support. (Default: `false`)
| webdav.serviceType | The service type to use for the webdav service. (Default: `ClusterIP`)
| webdav.servicePort | The service port to expose for the webdav service.  (Default: `80`)
| webdav.image | The image which provides webdav service. (Default: `wheatstalk/docker-php-webdav:0.2`)
| webdav.port | The port exposed by the container image which should be plumbed into the service.
| webdav.username | The username to log into WebDAV. (Default: `webdav-user`)
| webdav.password | The password to log into WebDAV. No default. This is a required field.
| sftp.annotations | Provide annotations to all webdav resources.
| webdav.ingress | Please see the documentation for `ingress` to see all available options.
### Default Persistence Values Documentation
| Value | Description |
| ----- | ----------- |
| persistence.storageClass | The default storage class that all PVCs will use.
