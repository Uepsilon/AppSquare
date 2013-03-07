class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => :imprint

  def index

  end

  def download
    file_path = Rails.root + "shared" + "files" + "#{current_user.channel}.pdf"

    if File.exists? file_path
      send_file(file_path,
                :filename       =>  "Filename.pdf",
                :type           =>  'application/pdf',
                :disposition    =>  'attachment')
    else
      flash[:alert] = "Datei wurde nicht gefunden"
      redirect_to :root
    end
  end
end
