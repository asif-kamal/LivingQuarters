# Rails Portfolio Project - LivingQuarters

 Ruby on Rails portfolio project by Asif Kamal

LivingQuarters is an application that allows hosts to create location sites. These location sites have attractions that guests can participate in by joining an assignment. The host and the guests co-operate to experience living in a certain part of the world with its limitations. The goal of this website is to connect people to find out about alternative ways of living and meet others who can teach them how.


## Usage

- After cloning this repo, run `bundle` to install dependencies.
- To create your local database, run `rake db:migrate`.
- Run `rake db:seed` to load seed data for Locations, Hosts, Attractions, and Experience Reports.
- You can start the application (without secure connection) by running `rails s` from the application root folder. Then in a browser, go to http://localhost:3000/ to begin.

- Facebook login requires a secure connection, so to start the application utilizing the Facebook login, run `thin start --ssl` from the application root folder.
- In a browser, go to https://localhost:3000/ to begin.




## Contributing

Bug reports and pull requests are welcome on GitHub at https://https://github.com/asif-kamal/LivingQuarters. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.



## License

The gem is available as open source under the terms of the **MIT License** (http://opensource.org/licenses/MIT).
