# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




DATA = {
  :location_keys =>
    ["name", "location", "description"],
  :locations => [
    ["Camp Chautaugua", "Upstate New York", "Exclusive 1950's era family resort for those with high-end tastes"],
    ["Camp Adirondack", "Upstate New York", "Nestled on a tranquil lake in the Adirondack Mountains of upstate New York"],
    ["Mt. Baker Camp", "Mt. Baker Ski Area", "When the ski season is over, we have endless hiking trails, climbing, and star-gazing"],
    ["Camp Snoqualmie", "Glacier, Washington", "With several lakes in the area, we focus on water sports and activities"],
    ["Camp Boundary Waters", "Northern Minnesota", "In the land of ten thousand lakes, we have so many that we spend days canoeing and kayaking and nights camping under the clear Minnesota skies"],
  ],
  :host_keys =>
    ["name", "email"],
  :hosts => [
    ["Max McGrath", "max@gmail.com"],
    ["Shree Rajneesh", "osho@hotmail.com"],
    ["Jake Enthal", "JEnthal@lollipop.com"],
    ["Megan Sexton", "megan@gmail.com"],
    ["Hayden Byerly", "haydenb@gmail.com"],
    ["Asif Kamal", "akamal@omega.com"],
    ["Lao Tzu", "LaoT@gmail.com"],
    ["Tyra Banks", "bombi@yahoo.com"],
    ["Jalludin Rumi", "freedom@winston.com"]
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
    ["Sexual Magic", "Transform your energy to bring happier states of consciousness", 4],
    ["Nadabrahma Meditation", "The Master Osho created a way for human beings breathe, shout and jump to be still.", 4],
    ["Zen HouseKeeping", "Maintain the cleanliness and upkeep of a Zen home as meditation practice!", 5],
    ["Cooking", "Connect with fellow friends and make food for everyone with love (which usually tastes better and is healthier)!", 2],
    ["Spiritual Talks", "Events given by Teachers from the area are meant to help those who seek for the Truth of who we are..", 2],
    ["Remembering", "Take time with another attendee to live in silence during your stay.", 3]
  ],
  :experience_report_keys =>
   ["title", "content", "camp_counselor_id", "activity_id"],
  :experience_reports => [
    ["Awesome!", "Cupcake ipsum dolor sit amet candy canes jelly beans. Cotton candy tootsie roll cheesecake sesame snaps ice cream jelly sesame snaps. Jujubes gummies apple pie jelly beans jujubes donut soufflé.", 1, 13],
    ["So cool...", "Cupcake ipsum dolor sit. Amet chupa chups muffin apple pie sweet pudding candy canes gingerbread. Sweet roll chocolate apple pie toffee gingerbread.", 2, 12],
    ["Supreme!", "Cupcake ipsum dolor sit. Amet candy canes lemon drops chupa chups caramels caramels soufflé. Sweet cheesecake cupcake. Soufflé chupa chups wafer bear claw biscuit dragée marzipan.", 3, 11],
    ["Om.", "Cupcake ipsum dolor sit amet lollipop soufflé muffin. Icing chocolate cake bear claw. Carrot cake powder bear claw marzipan cake jelly beans cotton candy lollipop candy. Candy canes chocolate cake cotton candy cookie gummi bears caramels brownie croissant.", 4, 10],
    ["Amazing", "Cupcake ipsum dolor sit amet pastry danish carrot cake. Cake pudding donut toffee muffin jelly. Liquorice gummies sweet carrot cake tart sesame snaps powder pie", 5, 9],
    ["Great Time!", "Cupcake ipsum dolor sit. Amet jelly beans donut biscuit cake bear claw pudding cookie. Gingerbread jelly-o jelly candy marshmallow croissant lollipop pudding!", 6, 8],
    ["Super Cool", "Cupcake ipsum dolor. Sit amet cotton candy fruitcake. Apple pie oat cake halvah halvah muffin candy canes muffin icing. Brownie bonbon soufflé jelly-o caramels wafer bear claw tart sweet roll.", 7, 7],
    [":)", "Cupcake ipsum dolor sit amet chupa chups chocolate cake. Soufflé dessert gummies. Pie tart wafer oat cake!", 8, 6],
    ["Namaste.", "Cupcake ipsum dolor sit amet toffee bear claw topping. Cotton candy tiramisu halvah topping donut soufflé. Halvah oat cake jelly chocolate cake brownie!", 9, 5],
    ["------ -", "Cupcake ipsum dolor sit. Amet pastry carrot cake fruitcake. Muffin bonbon cake caramels jujubes tootsie roll chocolate cake. Sugar plum jujubes toffee tiramisu macaroon apple pie lollipop biscuit candy canes!", 1, 4],
    ["Awesome Activity", "Cupcake ipsum dolor sit. Amet biscuit powder jelly beans. Chupa chups halvah chocolate tootsie roll lemon drops pastry jujubes. Pudding pastry marshmallow cotton candy topping oat cake cheesecake!", 2, 3],
    ["Really Neat", "Cupcake ipsum dolor sit amet wafer tiramisu sweet jelly. Chocolate cake toffee chocolate bar croissant icing toffee candy candy canes. Cheesecake ice cream marzipan chupa chups marzipan wafer macaroon!", 3, 2],
    ["Super Super!!", "Cupcake ipsum dolor sit. Amet chupa chups candy canes lemon drops caramels dragée sweet powder. Chocolate bar jelly tiramisu gingerbread danish jelly-o. Gummi bears cheesecake dessert!", 4, 1]
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
      host.send(DATA[:host_keys][i]+"=", attribute)
    end
    host.save
  end
end

def make_attractions
  DATA[:attractions].each do |attraction|
    new_attraction = Attraction.new
    attraction.each_with_index do |attribute, i|
      new_attraction.send(DATA[:activity_keys][i]+"=", attribute)
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
    new_experience_report.send(DATA[:new_experience_report_keys][i]+"=", attribute)
    end
    new_experience_report.save
  end
end

main
