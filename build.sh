rm -rf .repo/local_manifests/
# Init 
# repo init -u https://github.com/BlissRoms/platform_manifest.git -b universe --git-lfs
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b bliss .repo/local_manifests
# Fix crave
# rm -rf external/chromium-webview/prebuilt/*
# rm -rf .repo/projects/external/chromium-webview/prebuilt/*.git
# rm -rf .repo/project-objects/LineageOS/android_external_chromium-webview_prebuilt_*.git
# Sync
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)
fi
# Flags
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
# Set up build environment
source build/envsetup.sh
# Install clean
make installclean
# running configuration
blissify -g begonia
