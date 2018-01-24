#!/bin/bash
set -e
docker exec -it fzl_pgsql /bin/bash
#psql -U postgres -c "SHOW data_directory;"
