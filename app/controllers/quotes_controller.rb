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

      respond_to do |format|
        if @quote.save
          UserMailer.with(quote: @quote).practice_email.deliver_now!

          format.html{ redirect_to(@quote, notice: 'Quote was successfully created')}
          format.json{ render json: @quote, status: :created, location: @quote}

        else
          format.html { render action: 'new'}
          format.json {render json: @quote.errors, status: :unprocessable_entity}

        end
      end
  end

  def show
  	@quote = Quote.find(params[:id])
    render json: @quote, status: :ok
  end

  def update
  	@quote = Quote.find(params[:id])

  	 respond_to do |format|
      if @quote.update(quotes_params)
        UserMailer.with(quote: @quote).update_email.deliver_now!

          format.html{ redirect_to(@quote, notice: 'Quote was successfully edited')}
          format.json{ render json: @quote, status: :edited, location: @quote}

        else
          format.html { render action: 'new'}
          format.json {render json: @quote.errors, status: :unprocessable_entity}

        end
      #redirect_to quotes_path (index path)
    end
  end

  def destroy
  	@quote = Quote.find(params[:id])

    respond_to do |format|
  	 if @quote.destroy
      UserMailer.with(quote: @quote).destroy_email.deliver_now!

          format.html{ redirect_to(@quote, notice: 'Quote was successfully created')}
          format.json{ render json: @quote, status: :deleted, location: @quote}

        else
          format.html { render action: 'new'}
          format.json {render json: @quote.errors, status: :unprocessable_entity}

        end
      #redirect_to quotes_path (index path)
    end
  end
    
  

  private
  	def quotes_params
  		params.require(:quote).permit(:Enter_your_quote, :Written_by, :Email)
  	end
end
