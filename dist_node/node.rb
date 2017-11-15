require File.dirname(__FILE__) + "/normal_manager"
require File.dirname(__FILE__) + "/leader_manager"

class Node    
  def initialize(ip)
    $leader_ip = ip

    #Switching nomal and leader will be done by other method of Node class
    @manager = nomal_manager.new(leader_ip)
    #@manager = leader_manager.new()
  end

  def run
    while true
      @manager.thread
    end
  end
end
  