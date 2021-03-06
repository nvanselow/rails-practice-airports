#Let's Create a Review Site for Airports!

Let's create a Rails app that allows users to review airports. These are the criteria I want my app to satisfy in terms of listing airports.

#Things to Think About
- ER Diagram
- What models should we have?
- What is the relationship between them?

##To Pull This Down for Practice
- ` git clone https://github.com/CeeNoriega/rails-practice-airports.git `
- Create the databases `rake db:create`
- Run `rake`


##App Functionality
- [] An airport has to have a name, location (that includes city and state). It can optionally have a description.
- [] Visiting the `/airports` path should contain a list of airports.
- [] Visiting the `/airports/new` path should display a form for adding a new airport.
- [] If an airport is saved I should see the new airport I've added, and if it is not saved I'm left on the `/new` page and displayed an error.
- [] Visiting a specific airport's page should diplay information about that airport
- [] Visiting the root path should display a list of all airports.

Once I have this set up I want to give visitors of my app the ability to leave reviews for airports. Specifically I want my app to satisfy the following criteria:

- [] An airport can have many reviews. Each review must be for a specific airport, contain a rating that is a whole number between 1 - 5, a body, and a timestamp for when they are created.  
- [] If a review is saved, I'm redirected to the root path, if it is not saved, I should be left on the new review form page and render errors associated with the review.  
- [] Visiting a specific airport's page should also include all of the reviews for an airport listed below the airport information
