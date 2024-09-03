class Openai::ChatsController < ApplicationController
  def show

  end

  def generate_text
    @user_input = params[:user_input]

    if @user_input.present?
      client = OpenAI::Client.new
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: "あなたは3才の子供です。対話相手の言葉に対し、「〇〇ってなに？」「どうして〇〇なの？」のように質問をしてください。" },
            { role: "user", content: @user_input }
          ],
          max_tokens: 50,
          temperature: 0.7
        }
      )
      @generated_text = response.dig("choices", 0, "message", "content")
      render json:{text: @generated_text}
    end
  end
end
