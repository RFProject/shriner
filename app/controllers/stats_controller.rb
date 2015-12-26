class StatsController < ApplicationController


  def timeline
    @tweets = Tweet.all
    render json: @tweets
  end

end
