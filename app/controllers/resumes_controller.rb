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
    params.require(:resume).permit(:name, :general_info, :interests, :avatar, :user_id,
    	languages_attributes: [:id, :name, :level, :_destroy],
                                     educations_attributes:[:id, :date_from, :date_to, :level, :descrption, :place, :_destroy])
  end


end
