from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/health", methods=["GET"])
def health_check():
    return jsonify({"status": "UP"}), 200

@app.route("/products", methods=["GET"])
def get_products():
    # In a real application, this would fetch data from the RDS PostgreSQL database
    # For demonstration, returning dummy data
    products = [
        {"id": 1, "name": "Laptop", "price": 1200},
        {"id": 2, "name": "Mouse", "price": 25},
        {"id": 3, "name": "Keyboard", "price": 75},
    ]
    return jsonify(products), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)


