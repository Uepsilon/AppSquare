class PagesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_channel

  def index

  end

  protected

  def load_channel
    @channel = current_user.channel unless current_user.channel.empty?
  end
end
