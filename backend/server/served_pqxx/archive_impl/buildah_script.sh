buildah from --name psql_broker_beta docker.io/library/gcc
buildah add psql_broker_beta 'runtime_libs' 'usr/local/lib'
buildah add psql_broker_beta 'app/broker' 'tmp'
buildah add psql_broker_beta 'compile_libs/boost' 'usr/lib'
buildah add psql_broker_beta '/usr/local/lib/libboost_system.so.1.78.0' 'usr/local/lib'
buildah unshare
buildah mount psql_broker_beta

#buildah containers
#buildah run psql_broker_beta bash

#------------- BASH SCRIPT FOR CONTAINER [START]------------- 
# Set Boost_INCLUDE_DIR environment variable 
Boost_INCLUDE_DIR=/usr/lib
export Boost_INCLUDE_DIR
ldconfig

# Compile and install cmake
cd /usr/src/
wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1.tar.gz
tar xvf cmake-3.22.1.tar.gz
cd cmake-3.22.1
./bootstrap
gmake
gmake install

# Compile and install served 
git clone https://github.com/meltwater/served.git
cd served/
cmake ../served && make && make install

#Install libpqxx - PSQL connector library
apt install libpqxx-6.4 libpqxx-dev
ldconfig

# Compile and Install psql_broker
./compile.sh

#------------- BASH SCRIPT FOR CONTAINER [END]------------- 

# Create image from container
buildah commit ${CONTAINER_ID} ${IMAGE_NAME}

# Added below to CMakeList.txt 
# SET (Boost_INCLUDE_DIR "/usr/lib")
# Note: Environment var in cmake file is set as 'Boost_INCLUDE_DIRS' instead of 'Boost_INCLUDE_DIR'; fixed this and include directory, i.e., /usr/lib and cmake build was successful.. maybe bring typ to the attention of served maintainers?
