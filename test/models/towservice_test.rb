require "test_helper"

class TowserviceTest < ActiveSupport::TestCase
  def towservice
    @towservice ||= Towservice.new
  end

  def test_valid
    assert towservice.valid?
  end
end
