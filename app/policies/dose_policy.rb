class DosePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    logged_in_user_owner_or_admin?
  end

  def destroy?
    logged_in_user_owner_or_admin?
  end

  private

  def logged_in_user_owner_or_admin?
    if user.nil?
      false
    else
      record.cocktail.user == user || user.admin
    end
  end
end
