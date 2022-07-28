class TasksController < ApplicationController
    before_action :get_category, except: ['due_today']
    before_action :get_task, only: ['show', 'edit', 'update', 'destroy']
    before_action :post_time
    before_action :weather_api
  
    def index
      @tasks = @category.tasks
    end
  
    def new
      @task = @category.tasks.build
    end
  
    def show
    end
  
    def create
      @task = @category.tasks.build(task_params)
      @task.user_id = current_user.id
      if @task.save
        redirect_to category_path(@category)    
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to category_path(@category)  
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @task.destroy
      redirect_to category_path, status: 303
    end

    def due_today
      @tasks = Task.all
      @date = Date.today
    end
  
    private
    def get_category
      @category = Category.find(params[:category_id])
    end
  
    def get_task
      @task = @category.tasks.find(params[:id])
    end

    def post_time
      @time = Time.new
    end

    def weather_api
      @response = HTTParty.get("https://fcc-weather-api.glitch.me/api/current?lat=16.41639&lon=120.59306")
      @w_json = JSON.parse(@response.body)
    end
  
    def task_params
      params.require(:task).permit(:name, :description, :deadline, :category_id, :user_id)
    end
  end