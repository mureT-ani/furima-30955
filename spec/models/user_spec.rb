require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "ニックネーム、メールアドレス、パスワード、パスワード（確認用）、ユーザー本名、ユーザー本名のフリガナ、生年月日が存在すれば登録できること" do
      expect(@user).to be_valid
    end
  end
end
