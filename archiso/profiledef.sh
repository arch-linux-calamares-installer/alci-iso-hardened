#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="qalaalinux"
iso_label="QALAA_LINUX$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Qalaa Linux <https://github.com/MILOUDIAS/MILOUDIAS>"
iso_application="Qalaa Linux Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
# bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
# 	'uefi-ia32.systemd-boot.esp' 'uefi-x64.systemd-boot.esp'
# 	'uefi-ia32.systemd-boot.eltorito' 'uefi-x64.systemd-boot.eltorito')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
	'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
	'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')

arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
	["/etc/shadow"]="0:0:400"
	["/root"]="0:0:750"
	["/root/.automated_script.sh"]="0:0:755"
	["/root/.gnupg"]="0:0:700"
	["/usr/local/bin/choose-mirror"]="0:0:755"
	["/usr/local/bin/Installation_guide"]="0:0:755"
	["/usr/local/bin/livecd-sound"]="0:0:755"
	["/etc/polkit-1/rules.d"]="0:0:750"
	["/etc/sudoers.d"]="0:0:750"
	["/usr/local/bin/create_lsb-release.sh"]="0:0:755"
	["/usr/local/bin/qalaalinux-before"]="0:0:755"
	["/usr/local/bin/fix-keys"]="0:0:755"
)
