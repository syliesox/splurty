class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong> Could not save.</strong> Please check the length of your entry.'
    end
    redirect_to root_path
  end

  def about
    @quote = Quote.new
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
