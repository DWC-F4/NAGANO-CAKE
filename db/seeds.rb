    User.create!(
      email: "test@test.com",
      first_name: "foo",
      last_name: "bar",
      first_name_kana: "フー",
      last_name_kana: "バー",
      postal_code: "123-5678",
      address: "東京都渋谷区神南1丁目19-11",
      phone_number: "050-1111-1111",
      password: "password",
      password_confirmation: "password",
    )

    Admin.create!(
    	email: "admin@admin.com",
    	password: "password",
    	password_confirmation: "password",
    	)

    Genre.create!(
      name: "ケーキ"
      )
    Genre.create!(
      name: "プリン"
      )
    Genre.create!(
      name: "焼き菓子"
      )
    Genre.create!(
      name: "キャンディ"
      )
    Genre.create!(
      name: "チョコレート"
      )

    5.times do |n|
      Product.create!(
        name: "test#{n+1}",
        introduction: "製品の紹介文です",
        price: (n+1)*100,
        genre_id: n+1,
        )
    end

