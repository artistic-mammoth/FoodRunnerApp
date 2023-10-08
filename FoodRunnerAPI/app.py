from flask import Flask
from flask_restful import Api, Resource, request
import product_service
import homepage_service
import category_service

app = Flask(__name__)
api = Api(app)

@app.route("/")
def index():
    return "API service for FoodRunnerApp"

class ProductsData(Resource):
    def get(self):
        args = request.args
        if len(args.to_dict()) == 0:
            return product_service.get_all_products(), 200
        
        category = args.get("category", default=None, type=str)
        if category != None:
            products = category_service.get_product_list_for_category(category)
            if len(products) != 0:
                return products, 200
            else:
                return "Bad category", 404

        productID = args.get("id", default=None, type=str)
        if productID != None:
            product = product_service.get_product_by(productID)
            if product != None:
                return product, 200
            return "Product not found", 404
        return "Bad request", 404

api.add_resource(ProductsData, "/products")

@app.route('/home-page-info', methods=['GET'])
def home_info_data():
    return homepage_service.get_home_data(), 200

if __name__ == '__main__':
    app.run(debug=False)
    