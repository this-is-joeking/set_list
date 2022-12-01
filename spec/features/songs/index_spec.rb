require 'rails_helper'

RSpec.describe 'songs index', type: :feature do

  describe 'as a user, ' do
    describe 'when i visit /songs' do
      it 'i see each songs title and play count' do
        carly  = Artist.create!(name: "Carly Rae Jepsen")
        song1 = Song.create!(title: 'I really like you', length: 208, play_count: 230944507, artist: carly)
        song2 = Song.create!(title: 'call me maybe?', length: 301, play_count: 931847509, artist: carly)

        visit "/songs"
        expect(page).to have_content(song1.title)
        expect(page).to have_content("Play count: #{song1.play_count}")
        expect(page).to have_content(song2.title)
        expect(page).to have_content("Play count: #{song2.play_count}")
      end
    end
  end
end