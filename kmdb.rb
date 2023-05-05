# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Model.destroy_all

# Generate models and tables, according to the domain model.
# did this in terminal and migration files

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

studio = Studio.new
studio ["name"] = "Warner Bros."
studio.save

#now I am going to put all the movies in the studio since they have an ID

warner_bros = Studio.find_by ({"name" => "Warner Bros."})

movie = Movie.new
movie["title"] = "Batman Begins"
movie ["rated"] = "PG-13"
movie ["year_released"] = "2005"
movie ["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie ["rated"] = "PG-13"
movie ["year_released"] = "2008"
movie ["studio_id"] = warner_bros["id"]
movie.save


movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie ["rated"] = "PG-13"
movie ["year_released"] = "2012"
movie ["studio_id"] = warner_bros["id"]
movie.save


#now I will do the actors since they don't have joins

actor = Actor.new
actor ["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor ["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor ["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor ["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor ["name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor ["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor ["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor ["name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor ["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor ["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor ["name"] = "Anne Hathaway"
actor.save

#Now I will add the roles using the two joins there

batman_begins = Movie.find_by({"title" => "Batman Begins"})
christian = Actor.find_by({"name" => "Christian Bale"})

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = christian["id"]
role["character_name"] = "Bruce Wayne"
role.save

michael = Actor.find_by({"name" => "Michael Caine"})

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = michael["id"]
role["character_name"] = "Alfred"
role.save

liam = Actor.find_by({"name" => "Liam Neeson"})

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = liam["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

katie = Actor.find_by({"name" => "Katie Holmes"})

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = katie["id"]
role["character_name"] = "Rachel Dawes"
role.save

gary = Actor.find_by({"name" => "Gary Oldman"})

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = gary["id"]
role["character_name"] = "Commissioner Gordon"
role.save

dark_knight = Movie.find_by({"title" => "The Dark Knight"})
christian = Actor.find_by({"name" => "Christian Bale"})

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = christian["id"]
role["character_name"] = "Bruce Wayne"
role.save

heath = Actor.find_by({"name" => "Heath Ledger"})

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = heath["id"]
role["character_name"] = "Joker"
role.save

aaron = Actor.find_by({"name" => "Aaron Eckhart"})

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = aaron["id"]
role["character_name"] = "Harvey Dent"
role.save

michael = Actor.find_by({"name" => "Michael Caine"})

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = michael["id"]
role["character_name"] = "Alfred"
role.save

maggie = Actor.find_by({"name" => "Maggie Gyllenhaal"})

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = maggie["id"]
role["character_name"] = "Rachel Dawes"
role.save

dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})
christian = Actor.find_by({"name" => "Christian Bale"})

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = christian["id"]
role["character_name"] = "Bruce Wayne"
role.save

gary = Actor.find_by({"name" => "Gary Oldman"})

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = gary["id"]
role["character_name"] = "Commissioner Gordon"
role.save

tom = Actor.find_by({"name" => "Tom Hardy"})

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = tom["id"]
role["character_name"] = "Bane"
role.save

joseph = Actor.find_by({"name" => "Joseph Gordon-Levitt"})

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = joseph["id"]
role["character_name"] = "John Blake"
role.save

anne = Actor.find_by({"name" => "Anne Hathaway"})

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = anne["id"]
role["character_name"] = "Selina Kyle"
role.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

movies = Movie.where({"studio_id" => warner_bros["id"]})
for movie in movies 
    movie_name = movie["title"]
    movie_rating = movie["rated"]
    movie_year = movie["year_released"]

    puts "#{movie_name} #{movie_year} #{movie_rating} #{studio_id}"

end 


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
