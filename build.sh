rm -rf .repo/local_manifests/
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b bliss .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
 fi
# fix crave error
rm -rf external/chromium-webview/prebuilt/*
rm -rf .repo/projects/external/chromium-webview/prebuilt/*.git
rm -rf .repo/project-objects/LineageOS/android_external_chromium-webview_prebuilt_*.git
# repo sync
curl https://raw.githubusercontent.com/sounddrill31/docker-images/04449990912b9d7ee594193883740037f0ac80a7/aosp/common/resync.sh | bash
# Fix git-lfs
repo forall -c "git lfs install && git lfs pull && git lfs checkout"
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BLISS_BUILD_VARIANT=gapps
source build/envsetup.sh
# running configuration
mka clean
blissify -c -g begonia
/opt/crave/crave_sign.sh
