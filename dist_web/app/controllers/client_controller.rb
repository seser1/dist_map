require 'socket'

class ClientController < ApplicationController
  protect_from_forgery :except => [:run]

  def show
    render 'client/show'
  end

  def run
    @port = 49153
  
    p params[:key]
    sock = TCPSocket.open("localhost",@port)
    sock.write("put " + params[:key] + " " + params[:value])
    sock.close

    render 'client/show'
  end
end
