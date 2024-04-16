# Clone Evolution X
repo init -u https://github.com/Evolution-X/manifest -b u
# repo sync
/opt/crave/resync.sh
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b evo-bego .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
 fi
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
source build/envsetup.sh
# Lunch configuration
lunch evolution_begonia-userdebug
# Clean
make installclean
# Build confriguration
m evolution
