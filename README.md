# ubuntu18-apache2-php7

A Docker image used for Apache-PHP dev environment.

- Run a container:
~~~~
    docker run -ti --name web-server -p 9922:22 -p 9980:80 -d iankao/ubuntu18-apache2-php7
~~~~
- Login via SSH:
~~~~
    root / password:changeme / port:9922
~~~~
- PHP info:
~~~~
    http://docker-machine ip:9980/index.php
~~~~
