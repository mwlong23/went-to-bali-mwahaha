class Seed
  Order.destroy_all
  Product.destroy_all
  User.destroy_all
  OrderItem.destroy_all
  def self.begin
    seed = Seed.new
    seed.generate_products
    seed.generate_admin

  end

  def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word, price: rand(10...100), description: Faker::Lorem.sentence(5, false, 0).chop)
    end
  end

  def generate_admin
    admin = User.create!(name: "admin", email:"admin@admin.com", password: "adminadmin", admin: true)
  end
end

Seed.begin
