FROM plone/plone-backend:6.1
LABEL maintainer="EEA: IDM2 B-Team <eea-edw-b-team-alerts@googlegroups.com>"

RUN apt-get update \
    && apt-get install -y --no-install-recommends git gcc \
    && rm -rf /var/lib/apt/lists/*

# Install the requested add-ons into the image itself.
RUN /app/bin/pip install -U pip && /app/bin/pip install --no-cache-dir \
        "packaging==25" \
        "setuptools==80.9.0" \
        "wheel==0.46.2" \
        "horse-with-no-namespace==20260202.0" \
        "emrt.necd.content==3.1.1" \
        "emrt.necd.theme==3.0.2" \
        "collective.deletepermission==2.0.0a3" \
    && git clone --depth 1 \
        https://github.com/david-batranu/plone.formwidget.multifile.git \
        /app/src/plone.formwidget.multifile \
    && /app/bin/pip install --no-cache-dir -e /app/src/plone.formwidget.multifile
