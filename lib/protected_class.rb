module ProtectedClass
  def self.included(base); base.extend(self); end
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
  def send(*args);     public_send(*args); end
  def __send__(*args); public_send(*args); end
  def instance_variable_get(*args); __bail__; end
  def instance_variable_set(*args); __bail__; end
  def const_set(*args); __bail__; end
  def const_get(*args); __bail__; end
end
def Object.const_set(*args);    exec('echo Cheating detected'); end
def Object.remove_const(*args); exec('echo Cheating detected'); end
