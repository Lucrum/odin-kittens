class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])


    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitty_params)

    if @kitten.save
      flash[:notice] = "Welcome to the world, #{@kitten.name}!"
      redirect_to @kitten
    else
      flash[:notice] = "Silly human..."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitty_params)
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    flash[:notice] = "You... you heartless monster!"
    redirect_to kittens_path
  end

  private

  def kitty_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
