#/bin/bash
for id in $(docker images | tr -s ' ' | cut -f3 -d ' '); do docker rmi -f k $id; done
#tr -s ' ' trasnform all multiple spaces in just one
#so that cut -d ' ' space delimiter can to undertand the columns of docker image output
# so docker rmi receive the images id to get your works done
