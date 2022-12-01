require 'rails_helper'
# feature tests meant to test a feature as a user would experience it
# like an integration test

RSpec.describe 'the songs show page' do
  it 'shows the song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 1051048)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 329, play_count: 20051048)
    visit "/songs/#{song1.id}"

    expect(page).to have_content(song1.title)
    expect(page).to_not have_content(song2.title)
  end
  
  it 'shows a individual song along with artist' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 1051048)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 329, play_count: 20051048)
    visit "/songs/#{song1.id}"

    expect(page).to have_content(artist.name)
  end

  it 'shows the length and play count' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 1051048)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 329, play_count: 20051048)
   
    visit "/songs/#{song1.id}"

    expect(page).to have_content(song1.length)
    expect(page).to have_content(song1.play_count)
  end

  it 'includes a link back to the sonds index page' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 1051048)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 329, play_count: 20051048)
   
    visit "/songs/#{song1.id}"

    expect(page).to have_link('All songs', href: "/songs")
    click_link "All songs"
    expect(current_path).to eq("/songs")
  end
end