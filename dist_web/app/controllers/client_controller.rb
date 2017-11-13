require 'socket'

class ClientController < ApplicationController
  protect_from_forgery :except => [:run]

  @@port = 49153

  def show
    render 'client/show'
  end

  def run
    @val = nil

    if params[:value] != nil
      sock = TCPSocket.open("localhost",@@port)
      sock.write("put " + params[:key] + " " + params[:value])
      sock.close
    else
      sock = TCPSocket.open("localhost",@@port)
      sock.puts("get " + params[:key])
      @val = sock.gets
      sock.close
    end

    render 'client/show'
  end
end
