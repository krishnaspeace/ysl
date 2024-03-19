
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b crdroid .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
 fi
# Clone crdroid 14
repo init --depth 1 -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
# repo sync
/opt/crave/resync.sh
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export CRDROID_MAINTAINER=krishnaspeace
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
source build/envsetup.sh
# Lunch configuration
lunch lineage_begonia-userdebug
# Build confriguration
m bacon
