#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
addon.d/80-gapps.sh
etc/g.prop
etc/permissions/com.google.android.camera2.xml
framework/com.google.android.camera2.jar
lib/libgcam.so
lib/libgcam_swig_jni.so
lib/libjni_eglfence.so
lib/liblightcycle.so
lib/libnativehelper_compat.so
@file.list@
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
