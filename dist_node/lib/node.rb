require File.dirname(__FILE__) + "/normal_node"
require File.dirname(__FILE__) + "/leader_node"

#Switching nomal and leader will be done by other method of Node class
#At this time, node's property is decided by the argument of runnning main.rb (can't change the property)
class Node

  #Initializing as a normal node or a leader node
  def initialize(ip=nil)
    if ip!=nil then
      @manager = NomalNode.new(leader_ip)
    else
      @manager = LeaderNode.new()
    end
  end

  #main roop
  def run
    while true
      @manager.thread
    end
  end

end
  