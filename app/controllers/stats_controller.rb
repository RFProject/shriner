class StatsController < ApplicationController

  def timeline
    @tweets = Tweet.all
    render json: @tweets
  end


  def create_data
    
    if params[:token] == "hackathon"
      Tweet.get_tweet
    else
      render :text => "error", :status => 500
  end
    
end
