class QuotesController < ApplicationController

require 'rubygems'
require 'ImageResize'

#input_image_filename, output_image_filename, max_width, max_height
Image.resize('being_quote.png', 'end_quote.png', 5, 5)

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
