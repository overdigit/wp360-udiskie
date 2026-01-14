#!/usr/bin/env sh
MOUNT_PATH="$(dirname "$0")"
MAC="$(cat /sys/class/net/eth0/address)"

repeating_script() {
  sed -i "/$MAC/d" "${MOUNT_PATH}/autoexec.list"
}

file_is_signed() {
  keyrings=
  for keyring in /usr/share/wp360-udiskie/keyrings/* /etc/wp360-udiskie/keyrings/*
  do
    if [ -r "${keyring}" ]
    then
      keyrings="${keyrings} --keyring ${keyring}"
    fi
  done
  if gpgv ${keyrings} "${1}.sig" "${1}" 2>/dev/null >/dev/null
  then
    return 0
  fi
  return 1
}

main() {
  repeating_script

  if file_is_signed "${MOUNT_PATH}/Application.tgz"
  then
    systemctl stop codesyscontrol
    # Such a backup can be obtained like so:
    # tar -C / -czf /home/user/Application.tgz /etc/codesyscontrol/CODESYSControl_User.cfg /var/opt/codesys/PlcLogic
    tar -C / -xf "${MOUNT_PATH}/Application.tgz"
    systemctl start codesyscontrol
  fi
}

main
