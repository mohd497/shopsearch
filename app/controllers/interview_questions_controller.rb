class InterviewQuestionsController < ApplicationController
  before_action :set_interview_question, only: [:show, :edit, :update, :destroy]

  # GET /interview_questions
  # GET /interview_questions.json
  def index
    @interview_questions = InterviewQuestion.all
  end

  def interviews_per_cat
    @iq = InterviewQuestion.select('question as title, answer as content').where(interview_category_id: params[:cat_id])
    render json: @iq
  end

  # GET /interview_questions/1
  # GET /interview_questions/1.json
  def show
  end

  # GET /interview_questions/new
  def new
    @interview_question = InterviewQuestion.new
  end

  # GET /interview_questions/1/edit
  def edit
  end

  # POST /interview_questions
  # POST /interview_questions.json
  def create
    @interview_question = InterviewQuestion.new(interview_question_params)

    respond_to do |format|
      if @interview_question.save
        format.html { redirect_to @interview_question, notice: 'Interview question was successfully created.' }
        format.json { render :show, status: :created, location: @interview_question }
      else
        format.html { render :new }
        format.json { render json: @interview_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_questions/1
  # PATCH/PUT /interview_questions/1.json
  def update
    respond_to do |format|
      if @interview_question.update(interview_question_params)
        format.html { redirect_to @interview_question, notice: 'Interview question was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview_question }
      else
        format.html { render :edit }
        format.json { render json: @interview_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_questions/1
  # DELETE /interview_questions/1.json
  def destroy
    @interview_question.destroy
    respond_to do |format|
      format.html { redirect_to interview_questions_url, notice: 'Interview question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_question
      @interview_question = InterviewQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_question_params
      params.require(:interview_question).permit(:question, :answer, :interview_category_id)
    end
end
