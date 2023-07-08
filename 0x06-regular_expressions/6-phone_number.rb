#!/usr/bin/env ruby
# A RegEX to match 10 digit phone numbers
puts ARGV[0].scan(/^[0-9]{10}$/).join