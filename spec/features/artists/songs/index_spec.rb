require 'rails_helper'

RSpec.describe 'Artists songs index' do 
  it 'shows all the songs for the artist' do 
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
    rasp = prince.songs.create!(title: 'Raspberry Beret', length: 245, play_count: 103874)

    visit "/artists/#{prince.id}/songs"
    
    expect(page).to have_content(purple.title)
    expect(page).to have_content(rasp.title)
  end

  it 'links to each songs show page' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
    rasp = prince.songs.create!(title: 'Raspberry Beret', length: 245, play_count: 103874)

    visit "/artists/#{prince.id}/songs"

    click_on purple.title
    expect(current_path).to eq("/songs/#{purple.id}")
  end

  it 'shows average song length' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
    rasp = prince.songs.create!(title: 'Raspberry Beret', length: 245, play_count: 103874)

    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 545")
  end
end