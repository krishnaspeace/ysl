rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1 --depth=1 && 
# Sync the repositories
/opt/crave/resync.sh  &&
# Clone twrp tree
 git clone https://github.com/krishnaspeace/twrp_device_xiaomi_begonia.git --depth 1 -b twrp-12.1 /device/redmi/begonia  && 
# Set up build environment
export BUILD_USERNAME=krishnaspeace 
 export BUILD_HOSTNAME=crave 
 source build/envsetup.sh && 
 
# Build the ROM
lunch twrp_begonia-eng && make installclean && make recoveryimage -j$(nproc --all)
