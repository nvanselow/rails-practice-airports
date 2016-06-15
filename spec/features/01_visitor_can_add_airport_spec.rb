require "rails_helper"

# [] A airport must have a name, city, and state. It can optionally have a description
# [] Visiting the `/airports/new` path should display a form for creating a new airport.
# [] When adding a new airport, if I fill out the form correctly, I should see the page for the newly created airport.
# [] When adding a new airport, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.


feature "visitors can add airports" do
  scenario "visitor adds new airport successfully" do

    visit new_airport_path
    expect(page).to have_content "New Airport Form"

    fill_in 'Name', with: "Boston Logan"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "Massachusetts"
    fill_in 'Description', with: "This airport is pretty decent! Could have more Dunks."

    click_button "Add Airport"

    expect(page).to have_content "Airport added successfully"
    expect(page).to have_content "Boston Logan"
    expect(page).to have_content "This airport is pretty decent! Could have more Dunks."
  end

  scenario "visitor does not provide proper information for an airport" do
    visit new_airport_path

    click_button "Add Airport"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
  end
end
