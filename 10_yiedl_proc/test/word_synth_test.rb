require 'minitest/autorun'
require_relative '../lib/word_synth'
require_relative '../lib/effects'

class WordSynthTest < Minitest::Test
  def setup
    @synth = WordSynth.new
  end

  def test_paly
    assert_equal 'Ruby is fun!', @synth.play('Ruby is fun!')
  end

  def test_play_with_reverse
    @synth.add_effect(Effects.reverse)
    assert_equal 'ybuR si !nuf', @synth.play('Ruby is fun!')
  end

  def test_play_with_echo
    @synth.add_effect(Effects.echo(2))
    assert_equal 'RRuubbyy iiss ffuunn!!', @synth.play('Ruby is fun!')
  end

  def test_play_with_reverse
    @synth.add_effect(Effects.loud(2))
    assert_equal 'RUBY!! IS!! FUN!!!', @synth.play('Ruby is fun!')
  end

  def test_play_with_many_effects
    @synth.add_effect(Effects.reverse)
    @synth.add_effect(Effects.echo(2))
    @synth.add_effect(Effects.loud(2))
    assert_equal 'YYBBUURR!! SSII!! !!NNUUFF!!', @synth.play('Ruby is fun!')
  end
end
