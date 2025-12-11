class MealsController < ApplicationController
  before_action :set_meal, only: %i[show update destroy]

  def index
    @meals = Meal.all
    render json: @meals.to_json(include: { meal_items: { include: [:food, :measure] } })
  end

  def show
    render json: @meal.to_json(include: { meal_items: { include: [:food, :measure] } })
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      render json: @meal, status: :created
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @meal.update(meal_params)
      render json: @meal
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @meal.destroy
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(
        :name,
        meal_items_attributes: [:id, :food_id, :measure_id, :quantity, :_destroy]
    )
  end

end
