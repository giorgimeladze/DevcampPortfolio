class PortfoliosController < ApplicationController
  #only index,new, and create doesn't need id at first
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_items = Portfolio.angular
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build}
  end

  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body,
          technologies_attributes: [:name]))
    respond_to do |format|
      if @portfolio.save
        format.html {redirect_to portfolios_path, notice: "Your portfolio was created"}
      else
        format.html {render :new}
      end
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html {redirect_to portfolios_path, notice: "Your portfolio was updated"}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
       format.html {redirect_to portfolios_path, notice: "Your portfolio was deleted"}
    end
  end
end
