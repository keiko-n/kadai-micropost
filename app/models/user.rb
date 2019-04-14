class User < ApplicationRecord
    before_save { self.email.downcase! }
    # User保存の前に{}内を実行する
    # self.email.downcase! 文字を全て小文字に変換する
    # ! をつけて自分自身を直接変換する
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: {maximum: 255 },
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                        uniqueness: { case_sensitive: false }
                        # uniqueness は重複を許さないバリデーション
                        # case_sensitive: falseは大文字と小文字を区別しない
    has_secure_password
    
    has_many :microposts
end
