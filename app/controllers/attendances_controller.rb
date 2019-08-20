class AttendancesController < ApplicationController
  def create
    lesson = Lesson.find(params[:lesson_id])
    current_user.attendance(lesson)
    flash[:success] = '投稿を受講しました。'
    redirect_to lesson_path(lesson)
  end

  def destroy
    lesson = Lesson.find(params[:lesson_id])
    current_user.unattendance(lesson)
    flash[:success] = '受講をやめました。'
    redirect_to lessons_path
  end
end
