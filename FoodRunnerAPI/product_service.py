import random

__products_data = [
        {
            "id": "f75e04fe-56da-4393-8f37-320171816177",
            "name": "Молоко Суперское",
            "ammount": "900 мл",
            "description": "Вкусно",
            "imageURLsSet": ["https://www.dropbox.com/scl/fi/ysbghpit8mmkraa0jewdp/promo_1.jpg?rlkey=rcxw9zdq0shccd7ogo0vdf3le&dl=1"],
            "price": 79
        },
        {
            "id": "b6389bd0-1944-4ee5-b3b2-d70bacdcb3ec",
            "name": "Новогодние печеньки",
            "ammount": "5 шт",
            "description": "new year",
            "imageURLsSet": ["https://img.freepik.com/free-photo/christmas-cookies_1303-4935.jpg?w=1800&t=st=1692288899~exp=1692289499~hmac=9d7cdf84e5e145f09fb3d66503b9572d382f0727f9cb3569e45a0c21903d4149"],
            "price": 110
        },
        {
            "id": "42fa36a8-8338-405d-aea3-558dceea24fb",
            "name": "Огурцы длинненькие",
            "ammount": "много штучек",
            "description": "кукамберс",
            "imageURLsSet": ["https://free-images.com/sm/4713/cucumber_vegetables_green_gourd.jpg"],
            "price": 90
        },
        {
            "id": "77a6ce41-80ba-4ae5-8f4d-0c878c9955a9",
            "name": "Круасанчик",
            "ammount": "1 шт",
            "description": "вкусненько",
            "imageURLsSet": ["https://img.freepik.com/free-photo/croissants-wooden-cutting-board_1150-28480.jpg?w=1800&t=st=1692288488~exp=1692289088~hmac=7824a522fb9d6f0a5191da115bdf4c569f959c3fa87239c0455e45d907b92a77"],
            "price": 120
        },
        {
            "id": "de3ab713-e4f0-44b6-8fc5-4660fbbcc0c3",
            "name": "Томаты))",
            "ammount": "250 гр",
            "description": "Нечего сказать, кушайте",
            "imageURLsSet": ["https://img.freepik.com/free-photo/tomatoes_144627-15411.jpg?w=2000&t=st=1692288563~exp=1692289163~hmac=3ba2fee4d0f23924505fd6e7e4c0d2e71993ca7ce727fa35e75f71398e202d49"],
            "price": 100
        }
]

def get_product_by(id: str):
    for product in __products_data:
        if(product["id"] == id):
            return product
    return None
    

def get_all_products() -> dict:
    return { "productsData": __products_data }


def get_random_products(count: int):
    data = []
    while len(data) < count:
        prod = random.choice(__products_data)
        if prod in data:
            continue
        data.append(prod)
    return data



# import uuid
# def generatePackOfIdS(count: int):
#     for i in range(count):
#         print(uuid.uuid4())

# generatePackOfIdS(4)