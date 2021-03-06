# Copyright 2016, Walmart Stores, Inc.
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

include_recipe "shared::set_provider"

 storage = nil
 node.workorder.payLoad[:DependsOn].each do |dep|
   if dep["ciClassName"] =~ /Storage/
      storage = dep
      break
    end
  end

if storage != nil
Chef::Log.info("------------------------------------------------------------------")
Chef::Log.info("No Update Operation Supported for Stoarge depandent Volums .. ")
Chef::Log.info("------------------------------------------------------------------")
#  include_recipe "volume::delete"
else
include_recipe "volume::add"
end
