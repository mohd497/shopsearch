class InterviewCategoriesController < ApplicationController
  before_action :set_interview_category, only: [:show, :edit, :update, :destroy]

  # GET /interview_categories
  # GET /interview_categories.json
  def index
    @interview_categories = InterviewCategory.all
  end

  def all_categories
    @categories = InterviewCategory.all.order(:id)
    render json: @categories
  end

  # GET /interview_categories/1
  # GET /interview_categories/1.json
  def show
  end

  # GET /interview_categories/new
  def new
    @interview_category = InterviewCategory.new
  end

  # GET /interview_categories/1/edit
  def edit
  end

  # POST /interview_categories
  # POST /interview_categories.json
  def create
    @interview_category = InterviewCategory.new(interview_category_params)

    respond_to do |format|
      if @interview_category.save
        format.html { redirect_to @interview_category, notice: 'Interview category was successfully created.' }
        format.json { render :show, status: :created, location: @interview_category }
      else
        format.html { render :new }
        format.json { render json: @interview_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_categories/1
  # PATCH/PUT /interview_categories/1.json
  def update
    respond_to do |format|
      if @interview_category.update(interview_category_params)
        format.html { redirect_to @interview_category, notice: 'Interview category was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview_category }
      else
        format.html { render :edit }
        format.json { render json: @interview_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_categories/1
  # DELETE /interview_categories/1.json
  def destroy
    @interview_category.destroy
    respond_to do |format|
      format.html { redirect_to interview_categories_url, notice: 'Interview category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_category
      @interview_category = InterviewCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_category_params
      params.require(:interview_category).permit(:title, :description)
    end
end
