class DosePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    if user.nil?
      false
    else
      record.cocktail.user == user || user.admin
    end
  end

  def destroy?
    if user.nil?
      false
    else
      record.cocktail.user == user || user.admin
    end
  end
end
