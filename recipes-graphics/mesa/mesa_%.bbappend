FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
# DRI3 note:
# With oe-core commit 8509e2e1a87578882b71948ccef3b50ccf1228b3 dri3 is set
# as default. To state out clearly that Raspi needs dri3 and to avoid surprises
# in case oe-core changes this default, we set dri3 explicitly.
SRC_URI_append_rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', \
                bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://0001-dri2-query-dma-buf-modifiers.patch' , '', d), \
                '', d)}"

PACKAGECONFIG_append_rpi = " gallium vc4 v3d kmsro ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)}"
DRIDRIVERS_class-target_rpi = ""
