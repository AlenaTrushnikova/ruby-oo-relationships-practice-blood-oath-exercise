class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age.to_i
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def cults
        BloodOath.all.select{|oath| oath.cult if oath.follower == self}
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def self.of_a_certain_age(age)
        self.all.select{|follower| follower if follower.age >= age}
    end

    def my_cults_slogans
        self.cults.each{|cult| cult.slogan}
    end

    def self.most_actives(num)
        self.all.max_by(num){|follower| follower.blood_oaths.size}
    end

    def self.most_active
        self.most_actives(1)
    end

    def self.top_ten
        self.most_actives(10)
    end

#     `Follower#cults`
#   * returns an `Array` of this follower's cults
# * `Follower#join_cult`
#   * takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers

# * `Follower.of_a_certain_age`
#   * takes an `Integer` argument that is an age and returns an `Array` of followers who are the given age or older
end