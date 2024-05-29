rm -rf .repo/local_manifests/
rm -rf external 
# Clone Bilss Os
repo init -u https://github.com/BlissRoms/platform_manifest.git -b universe --git-lfs
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b bliss .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
 fi
# repo sync
/opt/crave/resync.sh
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BLISS_BUILD_VARIANT=gapps
source build/envsetup.sh
# running configuration
blissify -g begonia
