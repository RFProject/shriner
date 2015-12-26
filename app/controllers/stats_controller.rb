class StatsController < ApplicationController

  def timeline
    @tweets = Tweet.all
    render json: @tweets
  end


  def create_data
    if params[:token] == "hackathon"
      Tweet.get_tweet
      render :text => "OK!"
    else
      render :text => "error", :status => 500
    end

  end
end
