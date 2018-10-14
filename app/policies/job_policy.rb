class JobPolicy < ApplicationPolicy

  def index?
    
  end
  
  def show?
    index?
  end

  def create?
    user.employer?
  end

  def update?
    create?
  end
end