require 'rails_helper'

RSpec.describe 'the artists show page' do
  it 'shows the artists name' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 1051048)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 329, play_count: 20051048)

    visit "/artists/#{artist.id}"

    expect(page).to have_content(artist.name)
  end

  it 'shows the artists average song length' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 1051048)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 329, play_count: 20051048)

    visit "/artists/#{artist.id}"

    expect(page).to have_content("Average song length")
    expect(page).to have_content(artist.songs.average(:length))
  end

  it 'shows the artists total song count' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 1051048)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 329, play_count: 20051048)

    visit "/artists/#{artist.id}"

    expect(page).to have_content("Total number of songs")
    expect(page).to have_content(artist.songs.length)
  end
end
