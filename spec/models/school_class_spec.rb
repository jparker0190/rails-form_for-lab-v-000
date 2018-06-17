require 'rails_helper'

describe SchoolsClass do
  before(:each) do
    @schools_class = SchoolsClass.create!(title: "Computer Science", room_number: 5)
  end

  it 'can be created' do
    expect(@schools_class).to be_valid
  end

end
