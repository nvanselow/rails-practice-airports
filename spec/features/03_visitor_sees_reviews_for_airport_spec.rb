require 'rails_helper'

# [] A airport can have many reviews. Each review must contain the following:
#   [] A rating
#   [] A body
#   [] A timestamp for when it was created
# [] Visiting the `/airports/1` path should also include all reviews for an airport with ID = 1.

feature "visitor sees list of reviews on airport page" do
  scenario "sees reviews for specific airport" do
    logan = Airport.create(name: "Boston Logan", city: "Boston", state: "MA")
    review_for_logan = Review.create(rating: 4, body: "This is a slightly less than rave review", airport: logan)

    visit airport_path(logan)

    expect(page).to have_content logan.name
    expect(page).to have_content review_for_logan.rating
    expect(page).to have_content review_for_logan.body
    expect(page).to have_content review_for_logan.created_at.strftime("%B %d %Y")
  end

  scenario "does not see other reviews for other airports" do
    logan = Airport.create(name: "Boston Logan", city: "Boston", state: "MA")
    review_for_logan = Review.create(rating: 4, body: "This is a slightly less than rave review", airport: logan)

    ohare = Airport.create(name: "O'Hare International", city: 'Boston', state: 'MA')
    review_for_ohare = Review.create(rating: 2, body: "smelled weird.", airport: ohare)

    visit airport_path(ohare)

    expect(page).to have_content ohare.name
    expect(page).to have_content review_for_ohare.body

    expect(page).not_to have_content review_for_ohare.rating
    expect(page).not_to have_content review_for_ohare.body
  end
end
