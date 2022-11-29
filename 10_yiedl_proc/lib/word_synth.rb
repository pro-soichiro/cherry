class WordSynth
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(original_words)
    @effects.inject(original_words) do |words, effect|
      effect.call(words)
    end
    # words = original_words
    # @effects.each do |effect|
    #   words = effect.call(words)
    # end
    # words
  end
end
