#
#    Copyright 2018 Moriyoshi Koizumi. All Rights Reserved.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

require 'fluent/plugin/parser'
require 'logfmt'

module Fluent
  module Plugin
    class LogfmtParser < Parser
      Plugin.register_parser('logfmt', self)

      config_set_default :time_key, 'time'

      def parse(text)
        r = Logfmt.parse(text)  
        time, record = convert_values(parse_time(r), r)
        yield time, record
      end
    end
  end
end
