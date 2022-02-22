#!/bin/sh
#------------- BASH SCRIPT FOR CONTAINER [START]------------- 
#Add basic/essential tools
apt update
apt install build-essential
apt install wget
apt install git
apt install libpq libpq-dev
apt install sed
apt install openssl # Need to find package - required for cmake compile... 
apt install cmake
apt install libpqxx-6.4
apt install libpqxx-dev

# Compile and install cmake
# cd /usr/src/
# wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1.tar.gz
# tar xvf cmake-3.22.1.tar.gz
# cd cmake-3.22.1
# ./bootstrap
# make -DCMAKE_USE_OPENSSL=OFF
# make install

# Compile and install served 
# mkdir /usr/src
cd /usr/src
git clone https://github.com/meltwater/served.git
cd served/
#sed -i -e s/Boost_INCLUDE_DIRS/Boost_INCLUDE_DIR/g CMakeLists.txt
cp /tmp/CMakeLists.txt .
cmake ../served && make && make install

# Compile and Install libpqxx - PSQL connector library
#git clone https://github.com/jtv/libpqxx.git
#cd libpqxx
#cmake ../libqxx && make && make install
#ldconfig

# Compile and Install psql_broker
cd /tmp
./compile.sh

#------------- BASH SCRIPT FOR CONTAINER [END]------------- 

# Create image from container
#buildah commit ${CONTAINER_ID} ${IMAGE_NAME}

# Added below to CMakeList.txt 
# SET (Boost_INCLUDE_DIR "/usr/lib")
# Note: Environment var in cmake file is set as 'Boost_INCLUDE_DIRS' instead of 'Boost_INCLUDE_DIR'; fixed this and include directory, i.e., /usr/lib and cmake build was successful.. maybe bring typ to the attention of served maintainers?
