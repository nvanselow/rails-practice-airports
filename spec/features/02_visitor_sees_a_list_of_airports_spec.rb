require 'rails_helper'

# [] Visiting the `/airports` path should contain a list of airports.
# [] Visiting the `/airports/10` path should show the airport details for a airport with the ID of 10.
# [] Visiting the root path should display a list of all airports.

feature "visitor sees a list of airports" do
  scenario "sees a list of airports and link for new airport" do
    logan = Airport.create(name: 'Boston Logan', city: 'Boston', state: 'MA')
    ohare = Airport.create(name: "O'Hare International", city: "Chicago", state: "IL")

    visit airports_path

    expect(page).to have_content "Boston Logan"
    expect(page).to have_link "O'Hare International"

    click_link "Add New Airport"

    expect(page).to have_content "New Airport Form"
  end

  scenario "clicks link and is taken to show page for given airport" do
    launch = Airport.create(name: "Boston Logan", city: "Boston", state: "MA", description: "Fine airport.")

    visit root_path

    click_link "Boston Logan"

    expect(page).to have_content launch.name
    expect(page).to have_content launch.city
    expect(page).to have_content launch.state
    expect(page).to have_content launch.description
  end
end
