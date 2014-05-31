# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2014 Jonathan Jason Dennis [Meticulus] (theonejohnnyd@gmail.com)
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

"""Custom OTA commands for m470"""

import common
import os
import sys
import time

LOCAL_DIR = os.path.dirname(os.path.abspath(__file__))
TARGET_DIR = os.getenv('OUT')

def addFolderToZip(info, directory, basedir):
    list = os.listdir(directory)
 
    for entity in list:
        each = os.path.join(directory,entity)
 
        if os.path.isfile(each):
            print "Adding vendor file -> "+ os.path.join(basedir, entity)
            info.output_zip.write(each, os.path.join(basedir, entity))
        else:
            addFolderToZip(info,each,os.path.join(basedir, entity))

def FullOTA_Assertions(info):

  info.output_zip.write(os.path.join(TARGET_DIR, "overrides"), "overrides")

  if os.path.isdir(os.path.join(TARGET_DIR, "overrides")):
  	addFolderToZip(info, os.path.join(TARGET_DIR, "overrides"),"overrides")
  else :
	print "Warning!: No override files found!"
	time.sleep(2)


  info.script.AppendExtra(
        ('package_extract_dir("overrides", "/tmp/overrides");\n'
         'set_perm(0, 0, 0777, "/tmp/overrides");'))

def FullOTA_InstallEnd(info):
  info.script.AppendExtra('assert(run_program("cp", "-f", "/tmp/overrides/lib/libbt-vendor.so", "/system/vendor/lib/libbt-vendor.so") == 0);')
