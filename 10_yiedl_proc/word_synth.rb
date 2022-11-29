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

# 各エフェクタの要件を整理する
# callメソッドは一つの引数を受け取る
# callメソッドは引数に対して何らかの効果を適用し、それを戻り値として返す
# つまり、Effectsモジュールの中に各エフェクトを特異メソッドとして定義してあげる
# 特異メソッドはProcオブジェクトを戻り値にする

# 今回はインスタンスを作成する必要がないためmoduleを使用
# 引数の個数に柔軟性は不要であるため、Proc.newではなくlambdaを使用





