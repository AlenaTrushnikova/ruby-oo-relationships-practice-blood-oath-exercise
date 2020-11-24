require 'pry'
class BloodOath
    attr_accessor :date, :follower, :cult
    
    @@all = []

    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        @date = Time.new.strftime("%Y-%m-%d")
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all.min_by{|oath| oath.date}.follower
    end

end