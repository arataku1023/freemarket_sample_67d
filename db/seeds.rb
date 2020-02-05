lady = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")


lady_tops = lady.children.create(:name=>"トップス")
lady_jackets = lady.children.create(:name=>"ジャケット/アウター")
lady_bags = lady.children.create(:name=>"バッグ")

mens_tops = mens.children.create(name:"トップス")
mens_pants = mens.children.create(name: "パンツ")
mens_shoes = mens.children.create(name: "靴")

 
lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{name:"ポロシャツ"},{:name=>"その他"}])
lady_jackets.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{name:"ダウンベスト"},{:name=>"その他"}])
lady_bags.children.create([{:name=>"ハンドバッグ)"}, {:name=>"トートバッグ"},{name:"スポーツバッグ"},{name: "ショルダーバッグ"},{:name=>"その他"}])

mens_tops.children.create([{:name=>"Tシャツ/カットソー（半袖/袖なし）"},{:name=>"Tシャツ/カットソー（七分/長袖）"},{:name=>"その他"}])
mens_pants.children.create([{:name=> "デニム/ジーンズ"},{name: "スラックス"},{name:"チノパン"},{:name=>"その他"}])
mens_shoes.children.create([{:name=>"スニーカー"}, {:name=>"サンダル"},{:name=>"ブーツ"},{:name=>"その他"}])


# lady = Category.create(name: "レディース")
# mens = Category.create(name: "メンズ")
# baby = Category.create(name: "ベビー・キッズ")
# home = Category.create(name: "インテリア・住まい・小物")
# book = Category.create(name: "本・音楽・ゲーム")
# hobby = Category.create(name: "おもちゃ・ホビー・グッズ")
# beauty = Category.create(name: "コスメ・香水・美容")
# mech = Category.create(name: "家電・スマホ・カメラ")
# sport = Category.create(name: "スポーツ・レジャー")
# handmade = Category.create(name: "ハンドメイド")
# ticket = Category.create(name: "チケット")
# mobil = Category.create(name: "自動車・オートバイ")
# other = Category.create(name: "その他")


# lady_tops = lady.children.create(name: "トップス")
# lady_jacket = lady.children.create(name: "ジャケット/アウター")
# lady_pants = lady.children.create(name: "パンツ")
# lady_skirt = lady.children.create(name: "スカート")
# lady_onepiece = lady.children.create(name: "ワンピース")
# lady_other = lady.children.create(name: "その他")

# mens_tops = mens.children.create(name:"トップス")
# mens_pants = mens.children.create(name: "パンツ")
# mens_bags = mens.children.create(name: "バッグ")
# mens_suits = mens.children.create(name:"スーツ")
# mens_hats = mens.children.create(name: "帽子")
# mens_shoes = mens.children.create(name: "靴")




# mens_tops.children.create([{:name=>"すべて"}, {:name=>"Tシャツ/カットソー（半袖/袖なし）"},{:name=>"Tシャツ/カットソー（七分/長袖）"},{:name=>"ポロシャツ"}{:name=>"その他"}])
# mens_pants.children.create([{:name=> "デニム/ジーンズ"},{name: "スラックス"},{name:"チノパン"},{:name=>"その他"}])
# mens_shoes.children.create([{:name=>"スニーカー"}, {:name=>"サンダル"},{:name=>"ブーツ"},{:name=>"その他"}])


