class CharactersController < ApplicationController

  # データ管理のところはログインしてないとだめでーす
  before_action :authentication, only: [:new, :create, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
    @leaderskill_array = Leaderskill.get_array
    @ability_array = Ability.get_array
  end

  def create
    @character = Character.new(character_params)
    # なんか以下2つを追加しないとエラーになる
    @leaderskill_array = Leaderskill.get_array
    @ability_array = Ability.get_array
    if @character.save
      redirect_to character_path(@character)
    else
      render 'new'
    end
  end

  def edit
    @character = Character.find(params[:id])
    @leaderskill_array = Leaderskill.get_array
    @ability_array = Ability.get_array
  end

  def update
    @character = Character.find(params[:id])
    @leaderskill_array = Leaderskill.get_array
    @ability_array = Ability.get_array
    if @character.update(character_params)
      redirect_to character_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_path
  end

  private
    def character_params
      params.require(:character).permit(
        :name,
        :realm_id,
        :property_id,
        :rarity,
        :type_id,
        :leaderskill_id,
        :skill,
        :skill_description,
        :ability1_id,
        :ability2_id,
        :ability3_id,
        :guild_battle_score,
        :rolling_quest_score,
        :body
      )
    end
end
