require 'rails_helper'


describe 'form page' do
  it 'form renders with the new action' do
    visit new_schools_class_path
    expect(page).to have_content("School Class Form")
  end

  it 'new form submits content and renders form content' do
    visit new_schools_class_path

    fill_in 'schools_class_title', with: "Software Engineering"
    fill_in 'schools_class_room_number', with: 10

    click_on "Create School class"

    expect(page).to have_content("Software Engineering")
  end

  it 'edit form submits content and renders form content' do
    @edit_schools_class = SchoolClass.create(title: "Computer Science", room_number: 5)

    visit edit_schools_class_path(@edit_schools_class)

    fill_in 'schools_class_title', with: "Risk Analysis"
    fill_in 'schools_class_room_number', with: 10

    click_on "Update School class"

    expect(page).to have_content("Risk Analysis")
  end

  it 'submitted new form creates a record in the database' do
    visit new_schools_class_path

    fill_in 'schools_class_title', with: "Sabermetrics"
    fill_in 'schools_class_room_number', with: 42

    click_on "Create School class"

    expect(SchoolClass.last.title).to eq("Sabermetrics")
  end

  it 'submitted edit form creates a record in the database' do
    @edit_db_schools_class = SchoolClass.create(title: "Computer Science", room_number: 5)

    visit edit_schools_class_path(@edit_db_schools_class)

    fill_in 'schools_class_title', with: "Machine Learning"
    fill_in 'schools_class_room_number', with: 11

    click_on "Update School class"

    expect(SchoolClass.last.title).to eq("Machine Learning")
  end
end

describe 'Show page' do
  let(:schools_class) { SchoolClass.create(title: "Computer Science", room_number: 5) }

  it 'renders properly' do
    visit schools_class_path(schools_class)
    expect(page.status_code).to eq(200)
  end

  it 'renders the school class title' do
    visit schools_class_path(schools_class)
    expect(page).to have_content("Computer Science")
  end
end