class PortfoliosController < ApplicationController
  #only index,new, and create doesn't need id at first
  def index
    @portfolio_items = Portfolio.all
  end

  def show

  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
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

  end
end
