class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  def reviews_per_house
    @reviews = Review.where(sfthouse_id: params[:sfthouse_id], accepted: true)
    render json: @reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    review = Review.where("device_token = ? and created_at > ?", params[:device_token], 1.days.ago)
    if review.count > 0
      render json: {error: "Already contains data!"}
    else
      review2 = Review.where("device_token = ? and sfthouse_id = ?", params[:device_token], params[:sfthouse_id])
      if review2.count > 0
        render json: {error: "Already contains data!"}
      else
        @review = Review.create(title: params[:title], description: params[:description], rating: params[:rating], sfthouse_id: params[:sfthouse_id], device_token: params[:device_token])
        if @review.save
          render json: {success: "Saved!"}
        else
          render json: {error: "Not saved!"}
        end
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :description, :rating, :sfthouse_id)
    end
end
