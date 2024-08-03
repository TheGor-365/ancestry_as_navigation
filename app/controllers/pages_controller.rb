class PagesController < ApplicationController
  before_action :set_page, only: %i[ show edit update destroy ]

  def index
    @pages = Page.all
  end

  def show; end
  def edit; end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.save ? (redirect_to page_url(@page)) : (render :new)
  end

  def update
    @page.update(page_params) ? (redirect_to page_url(@page)) : (render :edit)
  end

  def destroy
    @page.destroy
    redirect_to pages_url
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(
      :name,
      :content,
      :ancestry
    )
  end
end
