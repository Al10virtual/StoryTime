class StoriesController < ApplicationController
  before_action :set_kid, only: [:new, :create, :show]

  def new
    @story = Story.new
  end

  def create
    @story = @kid.stories.build(story_params)
    generate_story_content(@story)

    if @story.save
      redirect_to kid_story_path(@kid, @story)
    else
      render :new
    end

  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def set_kid
    @kid = Kid.find(params[:kid_id])
  end

  def story_params
    params.require(:story).permit(:theme, :lenght)
  end

  def calculate_age(date_of_birth)
    today = Date.today
    age = today.year - date_of_birth.year
    age -= 1 if today < date_of_birth + age.years
    age
  end

  def generate_story_content(story)
    story.prompt = "Agis comme un auteur pour enfants à succès. Ecris-moi une histoire #{story.lenght} sur le thème #{story.theme} pour #{@kid.first_name} qui a #{calculate_age(@kid.date_of_birth)} ans. "
    story.content = ChatGptService.generate_story(story.prompt)
  end

end
