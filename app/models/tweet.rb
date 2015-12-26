class Tweet < ActiveRecord::Base

  validates_uniqueness_of :tweet_id

  def self.get_tweet
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = "nR4EpNxsn5wx0i8DHAhRuMvpF"
      config.consumer_secret = "WaU2kLjULnU7v2LnLzBAPovaUbQxMd303v5bIhukniPGNfyetJ"
    end

    shrines = {'明治神宮' => '35.676703,139.699300,1km',
               '伏見稲荷大社' => '34.967143,135.772670,1km'}
    words = %w(初詣 参拝 お参り 賽銭)

    shrines.each do |name, val|
      self.create_from_res client.search(name, geocode: val), name
      words.each do |word|
        self.create_from_res client.search(word, geocode: val), name
      end
    end
  end

  def self.create_from_res(res, name)
    res_hash = res.to_h
    tweets = res_hash[:statuses]
    tweets.each do |tweet|
      if defined?(tweet[:geo][:coordinates])
        Tweet.create(tweet_id: tweet[:id],
                     text: tweet[:text],
                     row_created_at: tweet[:created_at],
                     latitude: tweet[:geo][:coordinates][0],
                     longitude: tweet[:geo][:coordinates][1],
                     shrine: name
        )
      end
    end
  end
  
end
