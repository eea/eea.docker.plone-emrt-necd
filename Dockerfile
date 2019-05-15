FROM plone:4.3.18
MAINTAINER "EEA: IDM2 B-Team"

COPY site.cfg /plone/instance/

RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential \
 libsasl2-dev python-dev libldap2-dev libssl-dev \
 vim libldap-common \
 && rm -vrf /var/lib/apt/lists/* \
 && gosu plone buildout -c site.cfg \
 && apt-get purge -y --auto-remove build-essential \
 libsasl2-dev python-dev libssl-dev

RUN mv /docker-initialize.py /original_initialize.py
COPY docker-initialize.py /docker-initialize.py
RUN chmod +x /docker-initialize.py
