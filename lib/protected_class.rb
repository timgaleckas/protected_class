module ProtectedClass
  def self.included(base)
    base.extend(self)
    base.freeze
  end
  def __bail__(method_sym=nil); exec('echo Cheating detected'); end
  def method_added(method_sym)
    return if instance_method(method_sym).__file__ == __FILE__
    exec('echo Cheating detected')
  end
  def method_removed(method_sym)
    return if instance_method(method_sym).__file__ == __FILE__
    exec('echo Cheating detected')
  end
  def method_undefined(method_sym)
    return if instance_method(method_sym).__file__ == __FILE__
    exec('echo Cheating detected')
  end
  def send(*args);     respond_to?(:public_send) ? public_send(*args) : super; end
  def __send__(*args); respond_to?(:public_send) ? public_send(*args) : super; end
  def instance_variable_get(*args); __bail__; end
  def instance_variable_set(*args); __bail__; end
end
