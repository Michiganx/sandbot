require 'telegram/bot'
token = '122759712:AAE3A0xPzCS-vQBjltV_e0GOGotfn7rDZ1k'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    puts message.text.to_s.upcase
    case message.text
      when '/start'
        bot.api.sendMessage(chat_id: message.chat.id, text: "Darude - #{message.from.first_name}storm")
      when '/name', -> (t) {t.to_s.upcase.end_with? 'NAME PLS'}
        bot.api.sendMessage(chat_id: message.chat.id, text: 'Darude - Sandstorm')
      # when '/name', -> (t) {[' 300', 'ТРИСТА', 'ТРИСТА'].any? { |word| t.to_s.upcase.include? word }}
      when '/three', -> (t) {(t.to_s.upcase.split & %w(300 ТРИСТА триста ТРИСТА триста)).any?}
        bot.api.sendMessage(chat_id: message.chat.id, text: "Отсоси у тракториста, #{message.from.first_name}")
    end
  end
end