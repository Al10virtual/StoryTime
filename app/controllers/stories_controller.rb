class StoriesController < ApplicationController
  before_action :set_kid, only: %i[new create show]

  def new
    @story = Story.new
    @contextual_question = Question.where(contextual: true).sample
    @answer = Answer.new(question: @contextual_question)
  end

  def create
    @story = Story.new(theme: story_params[:theme],
                       lenght: story_params[:lenght].to_i)
    # récupérer titre theme et lenght de l'histoire

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
    story.prompt = "Agis comme un auteur pour enfants à succès. Ecris une histoire de #{story.lenght} durée de type #{story.theme} pour #{@kid.first_name}. Adapte l'histoire à son age (#{calculate_age(@kid.date_of_birth)} ans). De plus, ajoute dans l'histoire le context suivant: à la question suivante, #{@contextual_question.title}, les parents de #{@kid.first_name} ont répondu #{@answer.content}. Donne-moi un JSON avec en clé title, le titre de cette histoire et une clé content avec le contenu de l’histoire."
    chat_gpt_response = JSON.parse(ChatGptService.generate_story(story.prompt))
    story.content = chat_gpt_response["content"]
    story.title = chat_gpt_response["title"]
  end
end
