class ReactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.review.user_id != user.id && Reaction.where(user_id: user.id, review_id: record.review.id).empty?
  end
end
