class SessionValidator

  def initialize(instance)
    @instance = instance
  end

  def self.validate(instance)
    new(instance).validate
  end

  def validate
    @instance ? valid_user : invalid_user
  end

  private
  def valid_user
    {user_id: @instance.id, valid: true}
  end

  def invalid_user
    {notice: "Invalid username or password", valid: nil}
  end
end
