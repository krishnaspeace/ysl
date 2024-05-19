rm -rf .repo/local_manifests/ 
# Clone Pixy Os
repo init -u https://github.com/PixysOS/manifest -b fourteen-v2
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b pixy .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
 fi
# repo sync
/opt/crave/resync.sh
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export PIXYS_MAINTANER=KRISHNA
source build/envsetup.sh
# lunch configuration
lunch pixys_begonia-ap1a-userdebug
# let's build it
m pixysrelease 
