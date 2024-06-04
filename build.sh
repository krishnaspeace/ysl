rm -rf .repo/local_manifests/
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b bliss .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
 fi
# repo sync
/opt/crave/resync.sh
# Fix git-lfs
repo forall -c "git lfs install && git lfs pull && git lfs checkout" 
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BLISS_BUILD_VARIANT=gapps
source build/envsetup.sh
# running configuration
mka installclean
blissify -g begonia
/opt/crave/crave_sign.sh
