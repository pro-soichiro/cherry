require 'minitest/autorun'
require_relative '../lib/ancon/user'
require_relative '../lib/ancon/project'
require_relative '../lib/ancon/apply'


class AnconTest < Minitest::Test

  def setup
    @pass_project = Project.new('project', ['ruby'])
    @fail_project = Project.new('project', ['python'])
    @user = User.new('user',['ruby','rails','react'])
  end

  def test_pass_apply
    apply = Apply.new(@user, @pass_project) 
    assert apply.accept? 
  end

  def test_fail_apply
    apply = Apply.new(@user, @fail_project) 
    refute apply.accept?
  end

end

