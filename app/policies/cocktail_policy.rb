class CocktailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    if user.nil?
      false
    else
      record.user == user || user.admin
    end
  end
end
