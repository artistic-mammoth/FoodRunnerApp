import product_service as product_service

__big_promo_data = [
      {
        "id": "bigPromo_1",
        "title": "Очень необходимая подборка",
        "imageURL": "https://www.dropbox.com/scl/fi/pc5ubmr4ekyfp8cee5r0s/bigPromo_1.jpg?rlkey=jn6bq2oyshi9vn73ywi8siyl7&dl=1"
      },
      {
        "id": "bigPromo_2",
        "title": "Сладенькое на десерт",
        "imageURL": "https://www.dropbox.com/scl/fi/g381833ahb73elnom25b6/bigPromo_2.jpg?rlkey=8euretkcerw9usf8el32tzl3z&dl=1"
      },
      {
        "id": "bigPromo_3",
        "title": "Шикарный завтрак",
        "imageURL": "https://www.dropbox.com/scl/fi/e36kayj85rv57kufr5r4d/bigPromo_3.jpg?rlkey=w4fsah99esc56ts1bxy0k85d2&dl=1"
      },
      {
        "id": "bigPromo_4",
        "title": "Взять с собой",
        "imageURL": "https://www.dropbox.com/scl/fi/59xoqa6hclbo8vc2nitg7/bigPromo_4.jpg?rlkey=er9qvxt810nycvjeb0lh5vy7z&dl=1"
      }
    ]


def get_home_data():
    data = {
        "BigPromoData": __big_promo_data,
        "ProductPromosIDs-1": product_service.get_random_products(4),
        "ProductPromosIDs-2": product_service.get_random_products(3),
    }
    return data
