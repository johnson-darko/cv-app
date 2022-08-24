class ResumesController < ApplicationController
  before_action :set_resume, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

def index
    @resumes = Resume.all
  end

  def show

  end

  def new
    #@resume = Resume.new
    @resume = current_user.resumes.build
  end

  def edit

  end

  def create
    #@resume = Resume.new(resume_params)
    @resume = current_user.resumes.build(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to resume_url(@resume), notice: "resume was successfully created." }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
   respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to resume_url(@resume), notice: "resume was successfully updated." }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to resumes_url, notice: "resume was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @resume = current_user.resumes.find_by(id: params[:id])
    redirect_to resumes_path, notice: "Not Authorized To Edit This resume" if @resume.nil?
  end

  private

  def set_resume
      @resume = Resume.find(params[:id])
    end

  def resume_params
    params.require(:resume).permit(:name_user, :user_info, :user_interest, :avatar_file_name , :avatar_content_type , :avatar_file_size , :avatar_updated_at , :project_name , :project_date_from , :project_date_to , :project_description , :project_technologies , :project_link , :language_name , :language_level , :project_role , :education_date_from , :education_date_to , :education_location , :education_level , :education_description ,  :job_date_from ,  :job_date_to ,  :job_company ,   :job_location ,  :job_position ,  :skill_title ,   :skill_level ,   :skill_color ,   :github_links ,   :linkdeln_links ,   :twitter_links)
      
  end


end
