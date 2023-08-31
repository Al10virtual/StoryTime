class StoriesController < ApplicationController
  before_action :set_kid, only: [:new, :create, :show]

  def new
    @story = Story.new
    @contextual_question = Question.where(contextual: true).sample
    @answer = Answer.new(question: @contextual_question)
  end

  def create
    @story = Story.new(theme: story_params[:theme],
                       lenght: story_params[:lenght].to_i)

    @story.kid = @kid
    @contextual_question = Question.find(params.dig(:story, :answer, :question_id))
    @answer = Answer.new(content: params.dig(:story, :answer, :content), kid: @kid, question: @contextual_question)
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
    story.prompt = "Agis comme un auteur pour enfants à succès. Ecris une histoire #{story.lenght} de type #{story.theme} pour #{@kid.first_name}. Adapte l'histoire à son age (#{calculate_age(@kid.date_of_birth)} ans). De plus, ajoute dans l'histoire le context suivant: à la question suivante, #{@contextual_question.title}, les parents de #{@kid.first_name} ont répondu #{@answer.content}"
    story.content = ChatGptService.generate_story(story.prompt)
  end

  def generate_story_speech
  end
end
