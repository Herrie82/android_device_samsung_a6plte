/*
 * Copyright (C) 2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#define LOG_TAG "android.hardware.light@2.0-service.samsung"

#include <iomanip>

#include "Light.h"

#define COLOR_MASK 0x00ffffff
#define MAX_INPUT_BRIGHTNESS 255

using android::hardware::light::V2_0::LightState;
using android::hardware::light::V2_0::Status;
using android::hardware::light::V2_0::Type;

namespace android {
namespace hardware {
namespace light {
namespace V2_0 {
namespace implementation {

/*
 * Write value to path and close file.
 */
template <typename T>
static void set(const std::string& path, const T& value) {
    std::ofstream file(path);
    file << value << std::endl;
}

template <typename T>
static T get(const std::string& path, const T& def) {
    std::ifstream file(path);
    T result;

    file >> result;
    return file.fail() ? def : result;
}

Return<Status> Light::setLight(Type type, const LightState& state) {
    if (type != Type::BACKLIGHT) {
        return Status::LIGHT_NOT_SUPPORTED;
    }

    uint32_t max_brightness = get(PANEL_MAX_BRIGHTNESS_NODE, MAX_INPUT_BRIGHTNESS);
    uint32_t color = state.color & COLOR_MASK;
    uint32_t brightness = ((77 * ((color >> 16) & 0xff)) +
            (150 * ((color >> 8) & 0xff)) + (29 * (color & 0xff))) >> 8;

    if (max_brightness != MAX_INPUT_BRIGHTNESS) {
        brightness = brightness * max_brightness / MAX_INPUT_BRIGHTNESS;
    }

    /*
     * Lock global mutex until light state is updated.
     */
    std::lock_guard<std::mutex> lock(mLock);

    set(PANEL_BRIGHTNESS_NODE, brightness);

    return Status::SUCCESS;
}

Return<void> Light::getSupportedTypes(getSupportedTypes_cb _hidl_cb) {

    _hidl_cb(std::vector<Type>({Type::BACKLIGHT}));

    return Void();
}

}  // namespace implementation
}  // namespace V2_0
}  // namespace light
}  // namespace hardware
}  // namespace android
