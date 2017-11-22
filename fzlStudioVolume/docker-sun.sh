docker run -d \
       -it \
       --name fzlStudioVolume \
       --mount source=myvol2,target=/app \
       nginx:latest
