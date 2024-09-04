class Openai::ChatsController < ApplicationController
  def show

  end

  def new
    @chat = Chat.new
  end

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
            { role: "system", content: "あなたは3才の子供です。対話相手の言葉に対し質問をしてください。次の例文を参考にしてください。（例1）〇〇ってなに？（例2）どうして〇〇なの？" },
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

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to root_path
    else
      flash.now[:danger] = "保存できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:title, :body)
  end
end
