FROM plone:4.3.18
MAINTAINER "EEA: IDM2 B-Team"


RUN echo "deb http://archive.debian.org/debian stretch main\ndeb http://archive.debian.org/debian-security stretch/updates main" > /etc/apt/sources.list \ 
 && apt-get update \
 && apt-get install -y --no-install-recommends build-essential \
 libsasl2-dev python-dev libldap2-dev libssl-dev \
 vim libldap-common \
 && rm -vrf /var/lib/apt/lists/*

COPY site.cfg /plone/instance/
# RUN echo -e "[versions]\n" > picked-versions.cfg; chown plone:plone picked-versions.cfg
RUN gosu plone buildout -c site.cfg 

RUN mv /docker-initialize.py /original_initialize.py
COPY docker-initialize.py /docker-initialize.py
RUN chmod +x /docker-initialize.py
