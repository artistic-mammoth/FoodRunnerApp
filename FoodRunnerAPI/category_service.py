import product_service

__bread_ids = ["f75e04fe-56da-4393-8f37-320171816177",
            "de3ab713-e4f0-44b6-8fc5-4660fbbcc0c3"]

def get_product_list_for_category(category: str):
    switch = {
        "bread": __bread_ids
    }
    products_ids = switch.get(category, [])
    products = []
    for id in products_ids:
        products.append(product_service.get_product_by(id))
    return products
