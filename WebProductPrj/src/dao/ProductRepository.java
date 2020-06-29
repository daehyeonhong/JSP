package dao;

import java.util.List;
import java.util.Vector;

import dto.Product;

public class ProductRepository {
	private static ProductRepository instance = new ProductRepository();
	List<Product> listOfProducts = new Vector<Product>();

	// 초기화
	public ProductRepository() {
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

	public static ProductRepository getInstance() {
		return instance;
	}

	public List<Product> getListOfProducts() {
		return listOfProducts;
	}

	public Product getProductById(String id) {
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product.getProductId().equals(id)) {
				return product;
			}
		}
		return null;
	}
}