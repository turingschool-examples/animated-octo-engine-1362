require "rails_helper"

RSpec.describe "the movies show page" do
  before(:each) do
    ghibli = Studio.create!(name: "Studio Ghibli", location: "Tokyo")
    mononoke = ghibli.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Action")
    
  end

  it "shows the employee's name, department, and list of tickets from oldest to newest" do
    visit "/employees/#{@jack.id}"
    expect(page).to have_content(@jack.name)
    expect(page).to have_content(@jack.department.name)
    expect(page).to have_content(@ticket1.subject)
    expect(page).to have_content(@ticket2.subject)
    expect(page).to have_content(@ticket3.subject)
    expect(@ticket1.subject).to be < @ticket2.subject
    expect(@ticket2.subject).to be < @ticket3.subject
    expect(@ticket1.subject).to be < @ticket3.subject
  end

  it "shows the oldest ticket assigned to the employee listed separately" do
    visit "/employees/#{@jack.id}"
    expect(page).to have_content("Oldest Ticket: #{@ticket1.subject}")
  end

  it "shows a form to add a ticket to this employee" do
    visit "/employees/#{@jack.id}"
    expect(page).to have_button("Search")
  end

  it "adds the searched ticket to the employee" do
    visit "/employees/#{@jack.id}"
    fill_in "Search", with: "#{@ticket4.id}"
    click_on("Search")
    expect(page).to have_content(@ticket4.subject)
  end
end
