require 'rails_helper'

RSpec.describe 'the artist edit' do
  it 'links to the edit page' do
    artist = Artist.create!(name: 'xx')
    
    visit '/artists'

    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit the artist' do
    artist = Artist.create!(name: 'Johny Cash')

    visit '/artists'

    expect(page).to have_content('Johny Cash')

    click_button 'Edit Johny Cash'

    fill_in 'name', with: 'Johnny Cash'
    click_button 'Update Artist'
    
    expect(current_path).to eq('/artists')
    expect(page).to have_content("Johnny Cash")
    expect(page).to_not have_content("Johny Cash")
  end
end