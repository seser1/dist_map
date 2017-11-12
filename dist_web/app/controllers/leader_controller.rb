class LeaderController < ApplicationController

  @@iplist = ["000.000.000.000", "111.111.111.111"]

  def iplist
    render json: @@iplist
  end
end
