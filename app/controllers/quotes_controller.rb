class QuotesController < ApplicationController


  def index
  	@quotes = Quote.all
  	render json: @quotes, status: :ok
  end

  def new
  	@quote = Quote.new
  end

  def edit
  	@quote = Quote.find(params[:id])
  end

  def create
  	 @quote = Quote.new(quotes_params)

    if @quote.save
      render json: @quote, status: :created, location: @quote
    else
      render json: @quote.errors, status: :unprocessable_entity
    end
  end

  def show
  	@quote = Quote.find(params[:id])
    render json: @quote, status: :ok
  end

  def update
  	@quote = Quote.find(params[:id])

  	if @quote.update(quotes_params)
      render json: @quote
  		#redirect_to @quote
  	else
      render json: @quote.errors, status: :unprocessable_entity
  		#render 'edit'
  	end
  end

  def destroy
  	@quote = Quote.find(params[:id])

  	 @quote.destroy
      redirect_to quotes_path #index path
    end
    
  

  private
  	def quotes_params
  		params.require(:quote).permit(:Enter_your_quote, :Written_by, :Email)
  	end
end
