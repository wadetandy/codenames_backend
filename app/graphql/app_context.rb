require 'graphql'

class AppContext < GraphQL::Query::Context
  def current_user
    self[:current_user]
  end
  alias_method :viewer, :current_user

  def session
    self[:session]
  end
end