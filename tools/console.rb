require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("name1", "loc1", 1984, "slogan1")
c2 = Cult.new("name2", "loc2", 1921, "slogan2")
c3 = Cult.new("name3", "loc3", 2000, "slogan3")

f1 = Follower.new("Adam", 18, "motto1")
f2 = Follower.new("Jack", 35, "motto2")
f3 = Follower.new("Anna", 27, "motto3")

o1 = BloodOath.new(f1, c1)
o2 = BloodOath.new(f1, c2)
o3 = BloodOath.new(f2, c2)
o4 = BloodOath.new(f3, c3)






binding.pry

=begin
def self.most_actives(num)
        self.all.max_by(num){|follower| follower.blood_oaths.count}
    end

    def self.most_active
        self.most_actives(1)
    end

    def self.top_ten
        self.most_actives(10)
    end
=end    

puts "Mwahahaha!" # just in case pry is buggy and exits