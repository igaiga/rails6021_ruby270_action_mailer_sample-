require 'test_helper'
class UserMailerTest < ActionMailer::TestCase
  test "welcome" do
    user = User.new(name: "igaiga", email: "igaiga@example.com")
    email = UserMailer.with(user: user).welcome
    # メールが送信キューに追加されるかどうかをテスト
    assert_emails(1){ email.deliver_now }
    # 送信されたメールを確認するテスト
    assert_equal ["perfect_rails@example.com"], email.from
    assert_equal ["igaiga@example.com"], email.to
    assert_equal "登録完了", email.subject
    assert_includes email.text_part.decoded, user.name
    assert_includes email.html_part.decoded, user.name
  end
end
