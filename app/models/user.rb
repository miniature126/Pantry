class User < ApplicationRecord
  has_many :storages, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]
  
  validates :name, presence: true, null: false,
                   length: { maximum: 20 }
  # 更新時、パスワードが入力されていなかった場合はは検証をスルーする

  def social_profile(provider)
    #条件に一致する値のみを抽出する。.to_sは文字列以外→文字列
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    #providerがomniauthのproviderと一致しなかった時、又はuidがomniauthのuidと一致しなかった時
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
    # self.set_values_by_raw_info(omniauth["extra"]["raw_info"])
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end
end
