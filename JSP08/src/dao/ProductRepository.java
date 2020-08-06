package dao;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import dto.Product;

public class ProductRepository {
	private static ProductRepository instance = new ProductRepository();
	List<Product> listOfProducts = new Vector<Product>();

	// 초기화
	public ProductRepository() {
		// inputFile();
		if (listOfProducts.size() == 0) {
			Product phone = new Product("P1234", "iPhone 6s", 800000);
			phone.setDescription("4.7-inch, 1334x750 Retina HD display, 8-megapixel iSight Camera");
			phone.setCategory("Smart Phone");
			phone.setManufacturer("Apple");
			phone.setUnitsInStock(1000);
			phone.setCondition("New");
			phone.setFilename("P1234.png");

			Product notebook = new Product("P1235", "LG PC Gram", 1500000);
			notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core process");
			notebook.setCategory("Notebook");
			notebook.setManufacturer("LG");
			notebook.setUnitsInStock(1000);
			notebook.setCondition("Refurbishied");
			notebook.setFilename("P1235.png");

			Product tablet = new Product("P1236", "Galaxy tab S", 900000);
			tablet.setDescription("212.8*125.6*6.6mm,Super AMOLED display, Octa-Core process");
			tablet.setCategory("Tablet");
			tablet.setManufacturer("Samsung");
			tablet.setUnitsInStock(1000);
			tablet.setCondition("Old");
			tablet.setFilename("P1236.png");

			listOfProducts.add(phone);
			listOfProducts.add(notebook);
			listOfProducts.add(tablet);
		}
	}

	public static ProductRepository getInstance() {
		return instance;
	}

	public List<Product> getListOfProducts() {
		return listOfProducts;
	}

	public Product getProductById(String id) {
		System.out.printf("전달된 ID: %s\n", id);
		System.out.printf("전체 등록갯수: %d\n", listOfProducts.size());
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product.getProductId().equals(id)) {
				return product;
			}
		}
		return null;
	}

	// 상품정보 추가
	public void addProduct(Product product) {
		listOfProducts.add(product);
		outputFile(listOfProducts);
	}

	// 파일로 저장 메소드
	public void outputFile(List<Product> listOfProducts) {
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("c:\\tmp\\productList.dat"))) {
			oos.writeObject(listOfProducts);
			System.out.println("저장 완료!");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 저장된 파일로부터 읽어오기
	public void inputFile() {
		try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("c:\\tmp\\productList.dat"))) {
			listOfProducts = (List<Product>) ois.readObject();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public String getProductSeq() {
		String seq = listOfProducts.get(listOfProducts.size() - 1).getProductId().substring(1);/* P1234 -> 1234 */
		int iSeq = Integer.parseInt(seq) + 1;
		return "P" + iSeq;
	}

	public List<String> getCategories() {
		/* 카테고리 정보를 중복되지 않게 저장하기 위해 set에 저장 */
		Set<String> set = new HashSet<String>();
		for (Product p : listOfProducts) {
			set.add(p.getCategory());
		}
		System.out.println(set);

		/* set에 저장된 카테고리 정보 list에 저장 */
		Iterator<String> itor = set.iterator();
		List<String> list = new ArrayList<String>();
		while (itor.hasNext()) {
			list.add(itor.next());
		}
		return list;
	}
}