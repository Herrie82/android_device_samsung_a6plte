#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Audio
#
# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
	af.fast_track_multiplier=1

#Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio_hal.period_size=192

##fluencetype can be "fluence" or "fluencepro" or "none"
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.audio.sdk.fluencetype=none\
	persist.vendor.audio.fluence.voicecall=true\
	persist.vendor.audio.fluence.voicerec=false\
	persist.vendor.audio.fluence.speaker=true

#disable tunnel encoding
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.tunnel.encode=false

#Buffer size in kbytes for compress offload playback
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.offload.buffer.size.kb=64

#Minimum duration for offload playback in secs
PRODUCT_PROPERTY_OVERRIDES += \
	audio.offload.min.duration.secs=30

#Enable offload audio video playback by default
PRODUCT_PROPERTY_OVERRIDES += \
	audio.offload.video=true

#Enable audio track offload by default
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.offload.track.enable=true

#Enable music through deep buffer
PRODUCT_PROPERTY_OVERRIDES += \
	audio.deep_buffer.media=true

#enable voice path for PCM VoIP by default
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.voice.path.for.pcm.voip=true

#Enable multi channel aac through offload
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.offload.multiaac.enable=true

#Enable DS2, Hardbypass feature for Dolby
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.dolby.ds2.enabled=false\
	vendor.audio.dolby.ds2.hardbypass=false

#Disable Multiple offload sesison
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.offload.multiple.enabled=false

#Disable Compress passthrough playback
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.offload.passthrough=false

#Disable surround sound recording
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.audio.sdk.ssr=false

#enable dsp gapless mode by default
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.offload.gapless.enabled=true

#enable pbe effects
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.safx.pbe.enabled=true

#parser input buffer size(256kb) in byte stream mode
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.parser.ip.buffer.size=262144

#enable downsampling for multi-channel content > 48Khz
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.playback.mch.downsample=true

#enable software decoders for ALAC and APE.
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.use.sw.alac.decoder=true\
	vendor.audio.use.sw.ape.decoder=true

#property for AudioSphere Post processing
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.pp.asphere.enabled=false

#Audio voice concurrency related flags
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.voice.playback.conc.disabled=true\
	vendor.voice.record.conc.disabled=false\
	vendor.voice.voip.conc.disabled=true

#Decides the audio fallback path during voice call,
#deep-buffer and fast are the two allowed fallback paths now.
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.voice.conc.fallbackpath=deep-buffer

#Disable speaker protection by default
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.audio.speaker.prot.enable=false

#Enable HW AAC Encoder by default
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.hw.aac.encoder=true

#flac sw decoder 24 bit decode capability
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.flac.sw.decoder.24bit=true

#Set AudioFlinger client heap size
PRODUCT_PROPERTY_OVERRIDES += \
	ro.af.client_heap_size_kbyte=7168

PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.audio.hw.binder.size_kbyte=1024

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.cne.feature=0

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.vidc.disable.split.mode=1

# Display
PRODUCT_PROPERTY_OVERRIDES += \
	debug.gralloc.enable_fb_ubwc=1 \
	debug.sf.enable_hwc_vds=1 \
	debug.sf.hw=0 \
	debug.egl.hw=0 \
    ro.opengles.version=196610 \
    ro.sf.lcd_density=420 \
    vendor.display.disable_ext_anim=1 \
    vendor.display.disable_skip_validate=1 \
    vendor.display.enable_default_color_mode=1 \

# Factory reset protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/config

# Perf
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.vendor.extension_library=libqti-perfd-client.so

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
	persist.camera.HAL3.enabled=0 \
	persist.vendor.camera.HAL3.enabled=0

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.sec.rild.libpath2=/vendor/lib/libsec-ril-dsds.so \
	vendor.sec.rild.libpath=/vendor/lib/libsec-ril.so \
	rild.libpath2=/vendor/lib/libsec-ril-dsds.so \
	rild.libpath=/vendor/lib/libsec-ril.so \
	ro.multisim.set_audio_params=true \
	ro.telephony.default_cdma_sub=0 \
    persist.radio.multisim.config=dsds \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
	persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.sib16_support=1 \

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.qcom.bluetooth.soc=pronto
