class SongsController < ApplicationController
  # before_action :fetch_song, only: [:show]
  def index
    @songs = Song.all
  end
  def new
    @song = Song.new
  end

  def show
    fetch_song
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    fetch_song
  end

  def update
    fetch_song
    if @song.valid?
      @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    fetch_song.destroy
    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def fetch_song
    @song = Song.find(params[:id])
  end
end
