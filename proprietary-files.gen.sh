#!/bin/bash

MY_DIR="${BASH_SOURCE%/*}"
OUTPUT=${BASH_SOURCE%.gen.sh}.txt

if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi
source $MY_DIR/blob_tool.sh || exit 1
if [[ -d "$1" ]]
then
    scan $1 || exit 2
elif [[ -f "$1" ]]
then
    load $1 || exit 3
else
    exit 4
fi

ignore sh
ignore awk
ignore grep
ignore fstab.qcom
ignore adpl
ignore group
ignore cplay
ignore e_loop
ignore hvdcp_opti
ignore rild
ignore DR_AP_Service
ignore izat.conf
#ignore libril.so
ignore hbtp_daemon
ignore netmgrd
ignore netmgr_config.xml
ignore dsi_config.xml
ignore pa_config
ignore diag_uart_log

#ignore libgps.utils.so
#ignore libloc_core.so
#ignore libmmcamera_interface.so
#ignore libmmjpeg_interface.so
#ignore libmm-imxcore.so

ignore libOmxAacEnc.so
ignore libOmxAmrEnc.so
ignore libOmxCore.so
ignore libOmxEvrcEnc.so
ignore libOmxQcelp13Enc.so
ignore libOmxVdec.so
ignore libOmxVenc.so
ignore libOmxG711Enc.so

ignore hostapd
ignore wpa_supplicant
ignore libwifi-hal.so
ignore libcld80211.so
ignore libwpa_client.so
ignore libqdMetaData.so
ignore libqservice.so
ignore libtinycompress.so

ignore ipacm
ignore IPACM_cfg.xml
ignore libbundlewrapper.so
ignore libdownmix.so
ignore libdynproc.so

ignore libqcompostprocbundle.so
ignore libqcomvisualizer.so
ignore libqcomvoiceprocessing.so
ignore libvisualizer.so
ignore libreverbwrapper.so

ignore libsdmutils.so
ignore librmnetctl.so
ignore librilutils.so
ignore liboffloadhal.so
ignore libnfnetlink.so
ignore libnetfilter_conntrack.so
ignore libkeystore-wifi-hidl.so
ignore libkeystore-engine-wifi-hidl.so
#ignore libkeymaster3device.so
ignore libipanat.so

ignore android.hardware.audio@2.0-service

pull_match_path Firmware \
    "firmware"

pull Platform \
    irsc_util \
    sec_config \
    sec_config_oem \
    subsystem_ramdump

pull Camera \
    gralloc.msm8953.so \
    libgrallocutils.so

fpull Base \
    group

pull Health \
    ssr_setup \
    thermal-engine

pull Time \
    time_daemon \
    -TimeService.apk

pull PeripheralManager \
    pm-proxy \
    pm-service

pull Sensors \
    android.hardware.sensors@1.0-service.rc \
    sensors.msm8953.so

pull_match_path Audio \
    libacdb \
    "\.acdb$" \
    audio.primary.msm8953.so

pull DSP \
    adsprpcd

pull_match_path Sound fa9872

pull Media \
    mediacodec.policy \
    libvqzip.so \
    libgpustats.so \
    somxreg.conf

pull GNSS \
    loc_launcher \
    xtra-daemon \
    lowi-server \
    libgnss.so \
    vendor.qti.gnss@1.0-service.rc \
    vendor.samsung.hardware.gnss@1.0-impl.so \
    android.hardware.gnss@1.0-impl-qti.so

pull_match_path Wifi \
    vendor/firmware/wlan

pull NFC \
    sec.android.hardware.nfc@1.1-service.rc

pull Wifi \
    cnss-daemon \
    macloader

pull_match_path GPU \
    vendor/firmware/a530 \
    vendor/lib/egl

pull GPU \
    vulkan.msm8953.so \
    librs_adreno.so \
    librs_adreno_sha1.so

pull Security \
    qseecomd \
    libQSEEComAPI.so \
    gatekeeper.msm8953.so \
    keystore.msm8953.so

pull Display \
    -libsdm-disp-vndapis.so \
    libsdmextension.so

pull_match_path Camera \
    vendor/firmware/cpp \
    gt24c128 \
    cat24c64 \
    s5k2x7sp \
    s5k2p6sx \
    sr556 \
    libmmcamera2 \
    libmmcamera_isp \
    "media_profiles.*xml$" \
    "media_codecs.*xml$" \
    "libjpeg.*so$"

pull Camera \
    camera.msm8953.so \
    sdm450_camera_a6plte.xml \
    libflash_pmic.so \
    libactuator_zc535.so \
    libmmcamera_cac3_lib.so \
    libmmcamera_dbg.so \
    libmmcamera_dcrf_lib.so \
    libmmcamera_dummyalgo.so \
    libmmcamera_eebinparse.so \
    libmmcamera_eeprom_util.so \
    libmmcamera_eztune_module.so \
    libmmcamera_facedetection_lib.so \
    libmmcamera_faceproc2.so \
    libmmcamera_faceproc.so \
    libmmcamera_hdr_gb_lib.so \
    libmmcamera_imglib.so \
    libmmcamera_interface.so \
    libmmcamera_paaf_lib.so \
    libmmcamera_pdafcamif.so \
    libmmcamera_pdaf.so \
    libmmcamera_ppbase_module.so \
    libmmcamera_quadracfa.so \
    libmmcamera_sw2d_lib.so \
    libmmcamera_thread_services.so \
    libmmcamera_tintless_algo.so \
    libmmcamera_tintless_bg_pca_algo.so \
    mm-qcamera-app \
    mm-qcamera-daemon

pull_match_path RIL \
    plmn

pull_match_path Perf \
    vendor/etc/perf

pull Perf \
    energy-awareness
    #vendor.qti.hardware.perf@1.0-service.rc \
    #libqti-perfd-client.so

pull RIL \
    -libril.so \
    vendor.samsung.hardware.radio.configsvc@1.0-service.rc \
    rmt_storage \
    tftp_server \
    libsec-ril-dsds.so \
    libsec-ril.so

pull FM \
    init.qti.fm.rc \
    vendor.qti.hardware.fm@1.0-impl.so

pull Fingerprint \
    libbauthserver.so

{
    gen-proprietary-files
} > $OUTPUT
