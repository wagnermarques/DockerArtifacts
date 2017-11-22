docker run -d -t -p 1433:1433 \
       -v ./datadir:/datadir:rw,z \
       -v ./logsdir:/logsdir/log:rw,z \
       -e ACCEPT_EULA='YES' \
       -e SA_PASSWORD='' \
       langdon/fedora-mssqlserver
