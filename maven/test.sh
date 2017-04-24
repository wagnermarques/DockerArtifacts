#!/bin/bash

NEXUS_BASE=http://localhost:8081/nexus
REST_PATH=/service/local
ART_REDIR=/artifact/maven/redirect

REDIRECT_URL=${NEXUS_BASE}${REST_PATH}${ART_REDIR}

echo "curl -sS -L ${REDIRECT_URL}"


curl -sS -L ${REDIRECT_URL}
