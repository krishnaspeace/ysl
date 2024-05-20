rm -rf .repo/local_manifests/ 
# Clone Everest Os
repo init -u https://github.com/ProjectEverest/manifest -b qpr2 --git-lfs
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b everest .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
 fi
# repo sync
/opt/crave/resync.sh
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
source build/envsetup.sh
# lunch configuration
lunch everest_begonia-userdebug
# Clean
make installclean
# Build confriguration
mka bacon
