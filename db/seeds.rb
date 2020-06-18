    User.create!(
      email: "test@test.com",
      first_name: "foo",
      last_name: "bar",
      first_name_kana: "フー",
      last_name_kana: "バー",
      postal_code: "123-5678",
      address: "東京都渋谷区神南1丁目19-11",
      phone_number: "050-1111-1111",
      user_status: "FALESE",
      password: "password",
      password_confirmation: "password",
    )

    Admin.create!(
    	email: "admin@admin.com",
    	password: "password",
    	password_confirmation: "password",
    	)