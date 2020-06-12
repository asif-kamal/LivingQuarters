# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




DATA = {
  :location_keys =>
    ["name", "address", "description"],
  :locations => [
    ["Secaucus Living", "Downtown Toronto", "Clean air for the Living. Come experience a freer life..."],
    ["Hatchback Moven", "Australian Outback", "Forget the angst of modern civilization. Live for a moment outside of yourself."],
    ["Glacier Hill", "Tibet", "Called Trinavamalis, known for where the first Zen master disappeared into the Infinite."],
    ["Poor Man's Backyard", "Hyderabad", "Spend a month living on the bare minimum yet enjoying the unsophistication of a simple life."],
    ["Danger Mountain", "Shaanxi, China", "Written as 危险山, the trails are precarious. But just below are houses built by aboriginal people."],
  ],
  :host_keys =>
    ["name", "email", "origin", "admin", "password"],
  :hosts => [
    ["Maggy Xes", "mx@mw.com", "Chicago", true, "password"],
    ["Skimi Jon", "sai@sai.com", "Berlin", false, "password"],
    ["Kao Lope", "kao@kalo.com", "Mumbai", false, "password"],
    ["Marry Gerrteru", "men@megan.com", "Austin", false, "password"],
    ["Haleyn Byacon", "hden@hen.com", "Sao Paulo", true, "password"],
    ["Gean Noip", "tenzing@ting.com", "Hyderabad", true, "password"],
    ["Dfeer Pale", "dis@ds.com", "New York", true, "password"],
    ["Cpea Kih", "cole@cle.com", "Tokyo", false, "password"],
    ["Deeeb Pssew", "wston@wton.com", "St. Petersburg", false, "password"]
  ],
  :attraction_keys =>
   ["name", "description", "location_id"],
  :attractions => [
    ["Local Hot Spring", "Enjoy steaming hot water, naturally sprung up from ground", 1],
    ["Deep Woods", "Get your love for nature on long trails through thick woods.", 2],
    ["Canoeing", "Paddle along the calm shores of a beautiful lake.", 3],
    ["Local bar near river", "Have a drink while you relax after a long day of immersing in the cold weather and local culture.", 1],
    ["Native American Arts", "Lodging here includes classes in creating original works of art lead by local First Nations group.", 5],
    ["Rustic Barns", "Take photos of Barns in the area!", 1],
    ["Makeshift Sports", "Pay a small fee to enjoy kicking a ball with little to no rules.", 1],
    ["Tantric Yoga", "Transform your energy to bring happier states of consciousness", 4],
    ["Nadabrahma Meditation", "The Master Osho created a way for human beings breathe, shout and jump to be still.", 4],
    ["Zen HouseKeeping", "Maintain the cleanliness and upkeep of a Zen home as meditation practice!", 5],
    ["Cooking", "Connect with fellow friends and make food for everyone with love (which usually tastes better and is healthier)!", 2],
    ["Spiritual Talks", "Events given by Teachers from the area are meant to help those who seek for the Truth of who we are..", 2],
    ["Remembering", "Take time with another attendee to live in silence during your stay.", 3]
  ],
  :experience_report_keys =>
   ["title", "content", "host_id", "attraction_id"],
  :experience_reports => [
    ["Felt like I was back in my childhood days :)", "Refreshed.", 1, 13],
    ["Enjoyed spendgin time in something I feel attuned to.", "Would love to come back!", 2, 12],
    ["Fresh and alive once again!", "I have met people here with whom I've really shared a connection with.", 3, 11],
    ["Om.", "The clarity of my Seeing has brought to a place I thought I had lost forever...", 4, 10],
    ["----", "Silence.", 5, 9],
    ["Highly Recommend this place!", "If you want to leave aside fruitless endeavors for good.", 6, 8],
    ["Thank you.", "Much love to the team who made this possible.", 7, 7],
    ["Best people I have had the chance to spend time with.", "Come here if you are seeking freedom.", 8, 6],
    ["Namaste.", "Yippee!", 9, 5],
    ["------ -", "! ! !", 1, 4],
    ["Happy.", "Slow down.", 2, 3],
    ["Yup.", "No worries.", 3, 2],
    ["Be Still", "Excellent climate.", 4, 1]
  ]
}

def main
  make_hosts
  make_locations
  make_attractions
  make_experience_reports
end

def make_hosts
  DATA[:hosts].each do |host|
    new_host = Host.new
    host.each_with_index do |attribute, i|
      new_host.send(DATA[:host_keys][i]+"=", attribute)
    end
    new_host.save
  end
end

def make_attractions
  DATA[:attractions].each do |attraction|
    new_attraction = Attraction.new
    attraction.each_with_index do |attribute, i|
      new_attraction.send(DATA[:attraction_keys][i]+"=", attribute)
    end
    if new_attraction.save
      2.times do
        new_attraction.assignments.create(:attraction_id => new_attraction.id, :location_id => new_attraction.location_id, :filled => false, :rating => 0)
      end
    end
  end
end




def make_locations
  DATA[:locations].each do |location|
    new_location = Location.new
    location.each_with_index do |attribute, i|
      new_location.send(DATA[:location_keys][i]+"=", attribute)
    end
    new_location.save
  end
end

def make_experience_reports
  DATA[:experience_reports].each do |experience_report|
    new_experience_report = ExperienceReport.new
    experience_report.each_with_index do |attribute, i|
    new_experience_report.send(DATA[:experience_report_keys][i]+"=", attribute)
    end
    new_experience_report.save
  end
end

main
