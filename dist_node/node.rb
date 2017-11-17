require File.dirname(__FILE__) + "/normal_manager"
require File.dirname(__FILE__) + "/leader_manager"

#Switching nomal and leader will be done by other method of Node class
#At this time, node's property is decided by the argument of runnning main.rb (can't change the property)
class Node    

  #Initializing as a leader node
  def initialize()
    @manager = leader_manager.new()
  end
  
  #Initializing as a normal node
  def initialize(ip)
  $leader_ip = ip
  @manager = nomal_manager.new(leader_ip)
  end

  def run
    while true
      @manager.thread
    end
  end
end
  