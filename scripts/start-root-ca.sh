#!/bin/bash

fabric-ca-server start \
    --cfg.identities.allowremove --cfg.affiliations.allowremove \
    -b ${USERNAME}:${PASSWORD} \
    --tls.enabled \
    --csr.hosts ${CSR_HOSTS},${CSR_HOSTS}-service
