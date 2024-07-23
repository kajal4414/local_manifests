rm -rf .repo/local_manifest
repo init -u https://github.com/crdroidandroid/android.git -b 13.0 --git-lfs
/opt/crave/resync.sh

rm -rf */xiaomi
rm -rf hardware/lineage/compat
rm -rf hardware/google/pixel/kernel_headers out

git clone -b 13.0 https://github.com/Kajal4414/android_device_xiaomi_spes.git device/xiaomi/spes
git clone -b 13.0 https://github.com/Kajal4414/android_vendor_xiaomi_spes.git vendor/xiaomi/spes
git clone -b uvite --depth 1 https://github.com/CHRISL7/kernel_xiaomi_sm6225.git kernel/xiaomi/spes
git clone -b lineage-20.0 --depth 1 https://github.com/Kajal4414/android_hardware_xiaomi.git hardware/xiaomi
git clone -b lineage-20.0 --depth 1 https://github.com/Kajal4414/android_hardware_lineage_compat.git hardware/lineage/compat

git config --global user.name "Kajal4414" && git config --global user.email "81718060+Kajal4414@users.noreply.github.com"
(cd device/xiaomi/spes && git pull && git cherry-pick eb06bec 6b49f66 33faf83 b94a188) # skiaglthreaded to remove kernel flags
# (cd vendor/xiaomi/spes && git pull && git reset --hard HEAD~1)

. build/envsetup.sh
lunch lineage_spes-user
make installclean
m bacon
