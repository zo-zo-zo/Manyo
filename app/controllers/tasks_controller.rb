class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.recent
  # 終了期限でソート
    if params[:sort_expired]
      @tasks = Task.all.order(deadline:"DESC").page(params[:page])
    elsif
      @tasks = Task.all.page(params[:page])
    end

    if params[:search]
  # 渡された値が空の場合
      if params[:title].blank? && params[:status].blank?
        @tasks = Task.all.page(params[:page])
  # もし渡されたパラメータがタイトルのみだった場合
      elsif params[:title] && params[:status].blank?
        # あいまい検索％％をつけることでそういう認識になる
        @tasks = Task.where("title LIKE ?", "%#{ params[:title] }%")
  # もし渡されたパラメータがステータスのみだった場合
      elsif params[:title].blank? && params[:status]
        # カラムのデータ型がintegerのため、あいまい検索でエラーが出た。そのため下の書き方でパラメーターをとる
        @tasks = Task.where(status: params[:status]).page(params[:page])
  # もし渡されたパラメータがタイトルとステータス両方だった場合
      else
        # タイトルとステータスの両方検索する場合にはwhere句とwhere句を繋げる
        @tasks = Task.where("title LIKE ?" , "%#{ params[:title] }%").where(status: params[:status]).page(params[:page])
      end
    end
  # 優先順位でソート
    if params[:sort_priority]
      @tasks = Task.all.order(priority:"ASC")
    elsif
      @tasks = Task.all.page(params[:page])
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice:"タスクを作成しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice:"タスクを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました！"
  end

  def confirm
    @task = Task.new(task_params)
    render :new if @task.invalid?
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
