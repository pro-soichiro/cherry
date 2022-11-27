class WordSynth
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(original_words)
    words = original_words
    @effects.each do |effect|
      # 元の文字を加工して再代入する(破壊的メソッド）
      words = effect.call(words)
    end
    words
  end
end


