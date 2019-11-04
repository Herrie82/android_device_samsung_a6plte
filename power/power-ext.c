#include <utils.h>
#include "hardware/power.h"
#define TSP "/sys/class/sec/tsp/"
#define LOG_TAG "PowerExt"
#include <log/log.h>

void power_set_interactive_ext(int on)
{
    ALOGI("set_interactive_ext: %s", on ? "1" : "0");
    sysfs_write(TSP "input/enabled", on ? "1" : "0");
}

void set_device_specific_feature(feature_t feature, int state)
{
    switch (feature) {
        case POWER_FEATURE_DOUBLE_TAP_TO_WAKE:
            ALOGI("POWER_FEATURE_DOUBLE_TAP_TO_WAKE %s", state ? "enabled" : "disabled");
            if (state) {
                sysfs_write(TSP "cmd", "aod_enable,1");
                sysfs_write(TSP "cmd", "set_aod_rect,1080,2220,0,0");
                sysfs_write(TSP "cmd", "doubletap2wake,1");
            } else {
                sysfs_write(TSP "cmd", "aod_enable,0");
                sysfs_write(TSP "cmd", "doubletap2wake,0");
            }
            break;
        default:
            break;
    }
}
