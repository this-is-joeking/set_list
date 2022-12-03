require 'rails_helper'

RSpec.describe 'the Artist creation' do
  it 'links to the new page from the artist index' do
    visit '/artists'
    click_link('New Artist')

    expect(current_path).to eq('/artists/new')
  end

  it 'can create a new artist' do
    visit '/artists/new'

    fill_in('Name', with: 'Bad Bunny')
    click_button('Create Artist')

    new_artist_id = Artist.last.id
    expect(current_path).to eq("/artists/#{new_artist_id}")
    expect(page).to have_content("Bad Bunny")

    visit '/artists'

    expect(page).to have_content("Bad Bunny")
  end
end