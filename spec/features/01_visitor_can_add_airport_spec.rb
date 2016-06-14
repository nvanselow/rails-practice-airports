require "rails_helper"

# [] A airport must have a name, address, city, state, and zip code. It can optionally have a description
# [] Visiting the `/airports/new` path should display a form for creating a new airport.
# [] When adding a new airport, if I fill out the form correctly, I should see the page for the newly created airport.
# [] When adding a new airport, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.


feature "visitors can add airports" do
  scenario "visitor adds new airport successfully" do

    visit new_airport_path
    expect(page).to have_content "New airport Form"

    fill_in 'Name', with: "Boston Logan"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "Massachusetts"
    fill_in 'Zip', with: "02111"
    fill_in 'Description', with: "This airport is pretty decent! Could have more Dunks."

    click_button "Add airport"

    expect(page).to have_content "airport added successfully"
    expect(page).to have_content "Boston Logan"
    expect(page).to have_content "This airport is pretty decent! Could have more Dunks."
  end

  scenario "visitor does not provide proper information for an airport" do
    visit new_airport_path

    click_button "Add airport"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
    expect(page).to have_content "Zip is not a number"
  end
end
