class CantTouchMe
  def initialize
    @response="no"
    @runner = CanTouchMe::Runner.new(self)
  end

  def do_it
    @runner.running
    @response
  end

  private
  def response=(response)
    @response=response
  end
  include ProtectedClass
end
