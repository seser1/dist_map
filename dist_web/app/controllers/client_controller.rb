class ClientController < ApplicationController
  port = 49153

  def show
    render 'client/show'
  end

  def run
    def put
      sock = TCPSocket.open("localhost",port)
      sock.write("put" + params[:key] + params[:value])
      sock.close
    end


    render 'client/show'
  end
end
