package dao;

import java.util.ArrayList;

import dto.Product;

//product 관리 객체
public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance() {
		return instance;
	}

	private ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334x750 Retina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");

		Product notebook = new Product("P1235", "LG PC Gram", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core process");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbishied");

		Product tablet = new Product("P1236", "Galaxy tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,Super AMOLED display, Octa-Core process");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}

	// 상품 리스트 출력 메소드
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	// 상품 id로 상품 정보 출력 메소드
	public Product getProductById(String productId) {
		Product productById = null;
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if ((product != null) && (product.getProductId() != null) && (product.getProductId().equals(productId))) {
				productById = product;
				break;// 반복문 나가기
			}
		}
		return productById;
	}

	// 상품 추가 메소드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}