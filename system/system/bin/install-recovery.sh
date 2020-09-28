#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:17a2ffd82fbe56bf29b975071cc4bc94b0ac6f79; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:fd117a0396c90b073bdbf8f329242e2a59989118 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:17a2ffd82fbe56bf29b975071cc4bc94b0ac6f79 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
