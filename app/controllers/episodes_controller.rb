class EpisodesController < ApplicationController
  before_action :set_episode, only: %i[ show edit update destroy ]

  def index
    @episodes = Episode.all
  end

  def show; end
  def edit; end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    respond_to do |format|
      if @episode.save
        format.html { redirect_to episode_url(@episode) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to episode_url(@episode) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url }
    end
  end

  private
  def set_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:title, :description, :file)
  end
end
