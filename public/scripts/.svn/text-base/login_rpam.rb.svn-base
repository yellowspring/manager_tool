#!/usr/bin/ruby 

require 'rpam' 
include Rpam 

if authpam("#{ARGV[0]}", "#{ARGV[1]}") == true
  puts "SUCCESS" 
else 
  puts "FAILED" 
end
