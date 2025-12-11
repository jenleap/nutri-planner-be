class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show update destroy ]

  # GET /foods
  def index
    @foods = Food.all
    render json: @foods.to_json(include: :measures)
  end

  # GET /foods/1
  def show
    render json: @food.to_json(include: :measures)
  end

  # POST /foods
  def create
    @food = Food.new(food_params)

    if @food.save
      render json: @food.to_json(include: :measures), status: :created, location: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      render json: @food.to_json(include: :measures)
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy!
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    # Strong params
    def food_params
      params.require(:food).permit(
        :name,
        :brand,
        measures_attributes: [
          :id, :quantity, :unit, :custom_unit, :calories,
          :carbs, :protein, :fat, :fiber, :_destroy
        ]
      )
    end
end
