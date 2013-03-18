class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => :imprint

  def index

  end

  def download
    file_name = "Unterlagen.pdf"
    file_name = current_user.filename unless current_user.filename.empty?

    file_path = Rails.root + "shared" + "files" + file_name

    if File.exists? file_path
      send_file(file_path,
                :filename       =>  file_name,
                :type           =>  'application/pdf',
                :disposition    =>  'attachment')
    else
      flash[:alert] = "Datei wurde nicht gefunden"
      redirect_to :root
    end
  end
end
