#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:26152976:fe83d65822147f8dc979aff47edf27a93e2150de; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13540000.dwmmc0/by-name/BOOT:19916816:e8aa55a0dce1c3032bfcb6fed91f30a29c9ab5ac \
          --target EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:26152976:fe83d65822147f8dc979aff47edf27a93e2150de && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
