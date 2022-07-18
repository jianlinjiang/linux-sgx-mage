#!/bin/bash
pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
popd > /dev/null

# Uninstall old sdk
sudo /opt/intel/sgxsdk/uninstall.sh

# Compile SDK and install
make USE_OPT_LIBS=3 sdk_no_mitigation
make sdk_install_pkg_no_mitigation
sudo mkdir -p /opt/intel
cd /opt/intel
yes yes | sudo ${SCRIPT_PATH}/linux/installer/bin/sgx_linux_x64_sdk_*.bin
cd -

Compile PSW and install
make deb_psw_pkg 
cd linux/installer/deb/libsgx-urts 
dpkg -i libsgx-urts*.deb
cd - 
cd linux/installer/deb/libsgx-enclave-common
dpkg -i libsgx-enclave-common*.deb
cd -
cd linux/installer/deb/libsgx-uae-service
dpkg -i libsgx-uae-service*.deb
cd -
cd linux/installer/deb/libsgx-launch
dpkg -i libsgx-launch-dev*.deb
dpkg -i libsgx-launch*.deb
cd -
cd linux/installer/deb/libsgx-quote-ex
dpkg -i libsgx-quote-ex-dev*.deb
dpkg -i libsgx-quote-ex*.deb
cd -
cd linux/installer/deb/sgx-aesm-service
dpkg -i libsgx-ae-epid*.deb
dpkg -i libsgx-ae-le*.deb
dpkg -i libsgx-ae-pce*.deb
dpkg -i libsgx-aesm-launch-plugin*.deb
dpkg -i sgx-aesm-service*.deb
dpkg -i libsgx-aesm-launch-plugin*.deb
dpkg -i libsgx-aesm-pce-plugin*.deb
dpkg -i libsgx-aesm-ecdsa-plugin*.deb
dpkg -i libsgx-aesm-epid-plugin*.deb
dpkg -i libsgx-aesm-quote-ex-plugin*.deb
dpkg -i libsgx-ae-qve*.deb
dpkg -i libsgx-dcap-quote-verify*.deb
dpkg -i libsgx-dcap-quote-verify-dev*.deb
dpkg -i libsgx-dcap-ql*.deb
dpkg -i libsgx-dcap-ql-dev*.deb
dpkg -i libsgx-pce-logic*.deb
dpkg -i libsgx-qe3-logic*.deb
dpkg -i libsgx-dcap-default-qpl*.deb
cd -

