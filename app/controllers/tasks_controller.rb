class TasksController < ApplicationController
  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result

    # keyword search (title OR description)
    if params[:keyword].present?
      @tasks = @tasks.where("title LIKE :q OR description LIKE :q", q: "%#{params[:keyword]}%")
    end

    # start_date >=
    if params[:start_date].present?
      @tasks = @tasks.where("deadline >= ?", params[:start_date])
    end

    # end_date <=
    if params[:end_date].present?
      @tasks = @tasks.where("deadline <= ?", params[:end_date])
    end

    # status filter (skip if 'none')
    if params[:status].present? && params[:status] != "none"
      @tasks = @tasks.where(status: params[:status])
    end

    # sorting toggle
    if params[:sort] == "deadline"
      direction = params[:direction] == "asc" ? :asc : :desc
      @tasks = @tasks.order(deadline: direction)
    else
      @tasks = @tasks.order(created_at: :desc)
    end
  end
end
