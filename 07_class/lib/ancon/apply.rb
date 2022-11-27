class Apply
  def initialize(user, project)
    @user = user
    @project = project
  end

  def accept?
    result = @user.skills.each do |user_skill|
      @project.skills.each do |project_skill|
        if project_skill == user_skill 
          return true
        else
          return false
        end
      end
    end
  end
end
