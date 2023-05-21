# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.delete_all

user = User.first
text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed nulla consequat, imperdiet arcu sed,
facilitates nisi. Nulla malesuada, odio nec dignissim ultrices, lacus dolor maximus sapien, consequat faucibus lorem
ex aliquam lacus. Nullam nisl mi, faucibus et dui vitae, pharetra cursus mauris. Donec condimentum sapien suscipit,
laoreet orci eu, sagittis diam. In sagittis lorem vitae dictum porttitor. Mauris pharetra vitae enim a viverra.
Mauris in efficitur sapien. Proin faucibus neque quis lobortis elementum. Morbi ultrices vehicula ligula sit amet
pharetra. Etiam cursus auctor sapien a blandit. Donec quis justo at eros feugiat bibendum quis non massa. Nam mattis
scelerisque facilisis. Aenean ante tortor, ultricies eu sollicitudin at, vestibulum ac turpis. Etiam tincidunt volutpat
diam in hendrerit. Vestibulum a vestibulum velit. Nulla volutpat leo ac vestibulum consectetur. Ut ullamcorper vel
lectus et malesuada. Aliquam id nulla id est iaculis placerat. In a elit non diam cursus bibendum sit amet vitae erat.
Aliquam eget pulvinar metus. Nunc interdum lobortis mauris. In a magna ac sapien iaculis tempor eu non erat. Mauris
vitae consequat diam, a dictum justo. Nulla lectus sem, placerat ut ultricies sit amet, efficitur et magna.'

p 'Iniciando ....'

Category.all.each do |category|
  30.times do
    Article.create(
      title: "Article #{rand(10_000)}",
      body: text,
      category_id: category.id,
      user_id: user.id,
      created_at: rand(365).days.ago
    )
  end
end

p 'Terminou...'
