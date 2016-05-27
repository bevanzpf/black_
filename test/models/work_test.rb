require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @work = @user.works.build(subject: "test", desc: "this is a test work")
  end

  test "should be valid" do
    assert @work.valid?
  end

  test "subject should be not nil" do
    @work.subject = "  "
    assert_not @work.valid?
  end

  test "desc should be not nil " do
    @work.desc = "   "
    assert_not @work.valid?
  end

  test "desc should within 255 character" do
    @work.desc = "a" * 256
    assert_not @work.valid?
  end

  test "user id should be present" do
    @work.user_id = nil
    assert_not @work.valid?
  end

  test "order should be most recent first" do
    assert_equal Work.first, works(:happy_working)
  end

  test "work should be destroy while user was delete" do
    @user.works.create!(subject: "exclent work", desc: "It's well done")
    assert_difference 'Work.count', -1 do
      @user.destroy
    end
  end


end
