# == Class: kairosdb::service
#
# Copyright 2016 Joshua M. Keyes <joshua.michael.keyes@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class kairosdb::service {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} from ${caller_module_name}")
  }

  if $::kairosdb::manage_service {
    service { $::kairosdb::service_name:
      ensure    => $::kairosdb::service_ensure,
      enable    => $::kairosdb::service_enable,
      hasstatus => $::kairosdb::service_hasstatus,
    }
  }
}
