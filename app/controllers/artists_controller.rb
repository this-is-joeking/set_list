class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end

  def index
    @artists = Artist.all
  end

  def new
  end

  def create
    artist = Artist.create(artist_params)
    redirect_to "/artists/#{artist.id}"
  end

  def artist_params
    params.permit(:name)
  end
end