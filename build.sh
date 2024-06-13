rm -rf .repo/local_manifests/
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b bliss .repo/local_manifests
# Sync
/opt/crave/resync.sh
# Flags
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
# Set up build environment
source build/envsetup.sh
# Install clean
make installclean
# running configuration
blissify -g begonia
