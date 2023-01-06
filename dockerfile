#
# Dockerfile to build Passport Status Maintenance container image.
#

FROM docker.io/nginx:1.23.3-alpine-slim

# The following labels should be set at build time.. Insane defaults are provided as a fallback:
#
# example command:
# 	docker build . \
# 	    --tag passport-status-maintenance:latest \
# 	    --build-arg BUILD_DATE="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
# 	    --build-arg BUILD_REVISION="$(git rev-parse --short=8 HEAD)"

ARG BUILD_DATE=0000-00-00T00:00:00Z
ARG BUILD_REVISION=00000000

LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.revision=${BUILD_REVISION}

LABEL org.opencontainers.image.authors="Digital Technology Solutions"
LABEL org.opencontainers.image.url="https://github.com/DTS-STN/"
LABEL org.opencontainers.image.vendor="Employment and Social Development Canada"
LABEL org.opencontainers.image.title="Passport Status - Maintenance"
LABEL org.opencontainers.image.description="An NGINX application that displays an 'under maintenance' page for all requested URLs."

COPY html/index.html /usr/share/nginx/html/index.html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf