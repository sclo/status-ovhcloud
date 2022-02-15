#!/usr/bin/env bash
#
# scrap status-ovhcloud.com pages

set -ueo pipefail

urls=(
  bare-metal-servers
  hosted-private-cloud
  public-cloud
  web-cloud
  customer-service
  network
)

exts=(
  json
  atom
  rss
)

OVHDIR='status_ovhcloud'
OVHURL='.status-ovhcloud.com/history.'
mkdir -p "${OVHDIR}"

for i in ${urls[*]}
do
  for ext in ${exts[*]}
  do
    curl -so "${OVHDIR}/${i}.${ext}" https://${i}${OVHURL}${ext}
  done
done
