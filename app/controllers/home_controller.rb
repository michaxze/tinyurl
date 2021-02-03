class HomeController < ApplicationController
  def index
  end

  def generate
    @link = Link.find_by(original_url: params[:url]) || 
      Link.new(original_url: params[:url])

    if @link.save
      redirect_to info_path(token: @link.code), notice: "TinyURL generated."
    else
      render :index
    end
  end

  def info
    @link = Link.find_by(code: params[:token])
  end

  def show
    @link = Link.find_by(code: params[:token])

    if @link.present?
      LinkService.new.viewed(@link.id, request.remote_ip)
      redirect_to @link.original_url
    else
      render plain: "Invalid TinyURL."
    end

  end
end
