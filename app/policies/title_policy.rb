class TitlePolicy
  attr_reader :user, :title

  def initialize(user, title)
    @user = user
    @title = title
  end

  def update?
    user.admin? or user.vip?
  end

  def create?
    user.admin?
  end

  def destroy?
    return false if @current_user == @user
    user.admin?
  end

end
