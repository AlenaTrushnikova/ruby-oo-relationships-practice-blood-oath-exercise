class Cult
    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        BloodOath.new(self, follower)
    end

    def cult_population
        BloodOath.all.select{|oath| oath.follower if oath.cult == self}.size
    end

    def self.find_by_name(name)
        self.all.select{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.select{|cult| cult.founding_year == year}
    end

    def average_age
       cult_age = []
       BloodOath.all.select{|oath| cult_age << oath.follower.age if oath.cult == self}
        (cult_age.sum.to_f) / (cult_age.length.to_f)
    end

    def my_followers_mottos
        BloodOath.all.select{|oath| puts oath.follower.life_motto if oath.cult == self}
    end

    def self.least_popular
        self.all.min_by{|cult| cult.cult_population}
    end

    def self.most_common_location
        hash = {}
        self.all.each {|cult| hash[cult.location] ? hash[cult.location] += 1 : hash[cult.location] = 1} 
        hash.max_by{|k, v| v}[0]
    end

end