class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  #only index,new, and create doesn't need id at first
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_items = Portfolio.angular
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build}
  end

  def create
    @portfolio = Portfolio.new(portfolios_params)
    respond_to do |format|
      if @portfolio.save
        format.html {redirect_to portfolios_path, notice: "Your portfolio was created"}
      else
        format.html {render :new}
      end
    end
  end

  def edit
    3.times { @portfolio.technologies.build}
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolios_params)
        format.html {redirect_to portfolios_path, notice: "Your portfolio was updated"}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
       format.html {redirect_to portfolios_path, notice: "Your portfolio was deleted"}
    end
  end

  private
  def portfolios_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                    )
  end

  def set_portfolio_item
    @portfolio = Portfolio.find(params[:id])
  end
end
