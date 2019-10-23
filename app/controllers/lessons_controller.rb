class LessonsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  def index
    if logged_in?
      @lessons = current_user.timeline.order(id: :desc).page(params[:page])
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = current_user.lessons.build(lesson_params)
    if @lesson.save
      flash[:success] = 'Lessonを投稿しました。'
      redirect_to @lesson
    else
      @lessons = current_user.timeline.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'Lessonの投稿に失敗しました。'
      render 'lessons/new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:success] = 'Lessonを更新しました。'
      redirect_to @lesson
    else
      flash.now[:danger] = 'Lessonの更新に失敗しました。'
      render 'lessons/edit'
    end
  end

  def destroy
    @lesson.destroy
    flash[:success] = '削除されました'
    redirect_back(fallback_location: root_path)
  end
  
  def attendance_user
    @lesson = Lesson.find(params[:id])
    @users = @lesson.att_users
  end
  
  private

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :content, :picture, :comment, :remove_picture, :video)
  end
  
  def correct_user
    @lesson = current_user.lessons.find_by(id: params[:id])
    unless @lesson
      redirect_to root_url
    end
  end
  
end

