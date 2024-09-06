class Openai::ChatsController < ApplicationController
  def show

  end

  # def new
  #   @chat = Chat.new
  # end

  def generate_text
    @histories = []
    @user_input = params[:user_input]
    @histories << @user_input
    if @user_input.present?
      client = OpenAI::Client.new
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: "Please act as a 3-year-old child. When the other person speaks a sentence with a subject and predicate, ask 'Why is the subject the predicate?' to inquire about the reason. If a noun appears, ask 'What is [noun]?' Ask only one question per response. Please respond in Japanese. Please use word なんで for Why and [noun]ってなに？ for What is [noun]?" },
            { role: "user", content: @user_input }
          ],
          max_tokens: 50,
          temperature: 0.7
        }
      )
      @generated_text = response.dig("choices", 0, "message", "content")
      @histories << @generated_text
      render json:{text: @generated_text}
    end
  end

  # def create
  #   @chat = Chat.new(chat_params)
  #   if @chat.save
  #     redirect_to root_path
  #   else
  #     flash.now[:danger] = "保存できませんでした"
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  private

  def chat_params
    params.require(:chat).permit(:title, :body)
  end
end
