#!/bin/bash
#
# Copyright (C) 2017 The LineageOS Project
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

set -e

# Required!
export DEVICE=tissot
export DEVICE_COMMON=msm8953-common
export VENDOR=xiaomi

export DEVICE_BRINGUP_YEAR=2017

# Hax for cam configs

CAMERA2_SENSOR_MODULES="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/lib/libmmcamera2_sensor_modules.so
LIBMORPHOHHT_4="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/lib/libmorphohht4.0.so
LIBMICAMHAL="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/lib/libMiCameraHal.so

sed -i "s|/system/etc/camera/|/vendor/etc/camera/|g" "$CAMERA2_SENSOR_MODULES"
sed -i "s|/system/etc/|/vendor/etc/|g" "$LIBMORPHOHHT_4"
sed -i "s|/system/etc/|/vendor/etc/|g" "$LIBMICAMHAL"

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh $@
