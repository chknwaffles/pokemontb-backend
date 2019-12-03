class UserSerializer < ActiveModel::Serializer
  attributes :id, :teams

  def teams
    object.teams.collect do |team|
      TeamSerializer.new(team)
    end
  end
end
