class DogsController < ApplicationController
  def create
    if current_user.nil?
      render json: {message: "must be logged in to create dog"}
    else
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: current_user.id
      )
      dog.save ? message = "dog saved!" : message = "error occurred"
      render json: {message: message}
    end
    # render json: {errors: dog.errors.full_messages}, status: 422
  end

  def update
    dog = Dog.find_by(id: params[:id])

    if current_user.nil?
      render json: {message: "user doesn't exist"}
    elsif current_user.id != dog.user_id
      render json: {message: "dog does not belong to user"}
    else
      dog.name = params[:name] || dog.name
      dog.age = params[:age] || dog.age
      dog.breed = params[:breed] || dog.breed
      dog.save ? message = "dog saved!" : message = "error occurred"
      render json: {message: message}
    end
  end

  def destroy
    dog = Dog.find_by(id: params[:id])

    if current_user.nil?
      render json: {message: "user doesn't exist"}
    elsif current_user.id != dog.user_id
      render json: {message: "dog does not belong to user"}
    else
      dog.destroy
      render json: {message: "dog deleted!"}
    end
  end

end