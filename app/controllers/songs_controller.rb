require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get "/songs" do
    erb :"/songs/index"
  end

  get "/songs/new" do
    erb :"/songs/new"
  end

  get "/songs/:slug" do
    @song=Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post "/songs" do
    @artist = Artist.all.find_by(name: params[:artist_name])
    if !@artist
      @artist = Artist.create({name: params[:artist_name]})
    end
    @song=Song.create({name:params[:song_name],artist_id:@artist.id})
    params[:genre_ids].each do |g_id|
      SongGenre.create({song_id:@song.id,genre_id:g_id})
    end
    flash[:message]="Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    @song=Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  patch "/songs/:slug" do
    @artist = Artist.all.find_by(name: params[:artist_name])
    if !@artist
      @artist = Artist.create({name: params[:artist_name]})
    end
    @song=Song.find_by_slug(params[:slug])
    @song.update(genre_ids:params[:genre_ids],artist_id:@artist.id)
    flash[:message]="Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
