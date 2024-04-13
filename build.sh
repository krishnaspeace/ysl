# Clone crdroid 14
repo init --depth 1 -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
# repo sync
/opt/crave/resync.sh
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b main .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
 fi
# Fixing fingerprint
rm -rf vendor/fingerprint/opensource/interfaces
git clone https://github.com/xiaomi-msm8953-devs/android_vendor_fingerprint_opensource_interfaces vendor/fingerprint/opensource/interfaces
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export CRDROID_MAINTAINER=krishnaspeace
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
source build/envsetup.sh
# Brunch configuration
breakfast ysl
brunch ysl
