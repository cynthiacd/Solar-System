#this class will create a new planet - you initialize and pass a planet hash with info: name, mass, gravity, moon_list, distance_from_sun_km, and diameter
class Planet
  attr_accessor :name, :mass_kg, :acceleration_due_gravity, :moons, :distance_from_sun_km, :diameter_km

  def initialize(planet)
    @name = planet[:name]
    @mass_kg = planet[:mass]
    @acceleration_due_gravity = planet[:gravity]
    @moons = planet[:moon_list]
    @distance_from_sun_km = planet[:distance_from_sun]
    @diameter_km = planet[:diameter]
  end

  #this method will return a string of a nicely formatted info about a planet
  def print_info()
    "Planet: #{@name}
    Mass (kg): #{@mass_kg}
    Diameter (km): #{@diameter_km}
    Distance from Sun (km): #{@distance_from_sun_km}
    Acceleration due to gravity (m/ss): #{@acceleration_due_gravity}
    Moons: #{@moons.join(", ") rescue "NA"}"
  end
  
end

#This class stores all planet inforamtion in an solar system array
#the array will hold the entire planet class object
class SolarSystem
  attr_reader :solar_system

  #this method runs when a new SolarStytem class is called
  #and creates a solar_system array that will hold planet objects
  def initialize
    @solar_system = []
  end

  #this method adds one singular planet class object to solar_system_array
  def add_new_planet(planet)
    @solar_system << planet
  end

  #this method add an array of planet class objects to solar_system_array
  def add_new_planets(list_of_planets)
    list_of_planets.each { |planet| @solar_system << planet }
  end

  #this method will print out the info about each planet
  def print_solar_system
    @solar_system.each do |planet|
      puts planet
      puts planet.print_info
    end
  end

  #interactive_display method will allow users to choose a planet to learn about within the specific solar system class object
  def interactive_display
    puts "In this solar system you can learn about planets: "
    #line 57 iteriates through the solar_system array: calls the reader method for name (written by attr) which returns the name - and the name gets put into this array
    planet_names_array = @solar_system.map {|planet_id| planet_id.name}
    puts planet_names_array
    input = ""
    until input == "EXIT"
      print "Enter the planet's name you would like to learn about (enter EXIT to quit): "
      input = gets.chomp
      if planet_names_array.include?(input) == true
        wanted_planet = @solar_system.map {|planet_id| planet_id if planet_id.name == input}.compact[0]
        puts wanted_planet.print_info
      elsif input == "EXIT"
        exit
      else
        puts "That is not a valid entry - try again"
      end
    end
  end

end

#planets array below is contains hashes of each planet's information
planets = [
            {
              name: "Mercury",
              mass: 3.30E23,
              gravity: 3.73,
              moon_list: ["NA"],
              distance_from_sun: 57909227,
              diameter: 4879
            },

            {
              name: "Venus",
              mass: 4.87E24,
              gravity: 9.03,
              moon_list: ["NA"],
              distance_from_sun: 108209475,
              diameter: 12104
            },

            {
              name: "Earth",
              mass: 5.97E24,
              gravity: 9.81,
              moon_list: ["The Moon"],
              distance_from_sun: 149598262,
              diameter: 12756
            },

            {
              name: "Mars",
              mass: 6.42E23,
              gravity: 3.73,
              moon_list: ["NA"],
              distance_from_sun: 227943824,
              diameter: 6792
            },

            {
              name: "Jupiter",
              mass: 1.90E27,
              gravity: 24.5,
              moon_list: ["Europa", "Ganymede", "Callisto", "Adrastea", "Lysithea", "Thebe"],
              distance_from_sun: 778340821,
              diameter: 142984
            },

            {
              name: "Saturn",
              mass: 5.68E26,
              gravity: 10.40,
              moon_list: ["62 total - most common: ", "Titan", "Enceladus", "Lapetus", "Rhea"],
              distance_from_sun: 1426666422,
              diameter: 120536
            },

            {
              name: "Uranus",
              mass: 8.68E25,
              gravity: 9.03,
              moon_list: ["27 total - most common: ", "Miranda", "Titania", "Ariel", "Umbriel", "Oberon"],
              distance_from_sun: 2870658186,
              diameter: 51118
            },

            {
              name:"Neptune",
              mass: 1.02E26,
              gravity:   11.8,
              moon_list: ["NA"],
              distance_from_sun: 4498396441,
              diameter: 49528
            }
          ]

#line 171 initializes the Solary_System Hash
my_solar_system = SolarSystem.new

#line 175 initializes each planet and stores the ids in an array
planets.map!{ |planet| Planet.new(planet) }

#lines 178-181 show how you can initialize and add planets individually
# my_solar_system.add_new_planet(Planet.new(planets[0]))
# my_solar_system.add_new_planet(Planet.new(planets[1]))
# my_solar_system.add_new_planet(Planet.new(planets[2]))
# my_solar_system.add_new_planet(Planet.new(planets[3]))

#line 178 addes the planets to the solar system
my_solar_system.add_new_planets(planets)

#line 187 returns the solary_stytem array of planet class objects
my_solar_system.solar_system

#line 190 will print out all information about each planet in solar system
# my_solar_system.print_solar_system

#line 193 will show the optional feature where an user can choose what planet info they would like to see
# my_solar_system.interactive_display



#another solar_system - just for fun :)
kepler_62_planets = [
                      {
                      name: "62f",
                      mass: (2.8 * 5.97E24),
                      diameter: (1.41 * 6371 * 2)
                      },

                      {
                      name: "62e",
                      mass: (4.5 * 5.97E24),
                      diameter: (1.61 * 6371 * 2)
                      },

                      {
                      name: "62d",
                      mass: (5.5 * 5.97E24),
                      diameter: (1.95 * 6371 * 2)
                      },
                      #
                      # {
                      # name: "62c",
                      # mass: ""
                      # },
                      #
                      # {
                      # name: "62b",
                      # mass: ""
                      # }
                    ]
#kepler_62 = SolarSystem.new
#kepler_62_planets.map!{ |planet| Planet.new(planet) }
#kepler_62.add_new_planets(kepler_62_planets)
#line 214 returns the solar_system array for solary_system kepler_62
#kepler_62.solar_system
#kepler_62.interactive_display
