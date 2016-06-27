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
    {user_id: @instance.id, valid: Proc.new { |action, path| {action => path}}}
  end

  def invalid_user
    {notice: "Invalid username or password", invalid: Proc.new { |action, path| {action => path}}}
  end
end
