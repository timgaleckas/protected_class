require 'lib/protected_class'
require 'lib/can_touch_me'
require 'lib/cant_touch_me'
[Object,String,Fixnum].each{|clazz|clazz.send :include, ProtectedClass}

Dir.glob('lib/user_defined/*.rb').each{|file|require file}

raise 'fail' unless CantTouchMe.new.do_it=="yes"
puts "pass"
