require 'rails_helper'

# [] Visiting the `/airports/1/reviews/new` should display a form for creating a new review for a airport with ID = 1.
# [] Form should validate all of the review properties and ratings must be between 1 and 5, inclusive. This should be a whole number.

feature "visitors can add reviews for airports" do
  scenario "adds a review for a airport successfully" do
    jfk = Airport.create(name: "John F. Kennedy International Airport", city: "New York City", state: "NY")

    visit new_airport_review_path(jfk)

    expect(page).to have_content "Review Form for John F. Kennedy International Airport"

    fill_in "Rating", with: 5
    fill_in "Review", with: "This is a raving review!"
    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content jfk.name
    expect(page).to have_content 5
    expect(page).to have_content "This is a raving review!"
  end

  scenario "adds a review for a airport unsuccessfully" do
    lax = Airport.create(name: "Los Angeles International Airport", city: "Los Angeles", state: "CA")

    visit airport_path(lax)

    click_link "Add a Review"
    expect(page).to have_content "Review Form for Los Angeles International Airport"

    fill_in "Rating", with: 8

    click_button "Add Review"

    expect(page).to have_content "Body can't be blank"
    expect(page).to have_content "Rating must be between 1 - 5"
  end
end
