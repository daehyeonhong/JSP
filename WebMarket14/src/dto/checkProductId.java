package dto;

import java.util.ArrayList;
import java.util.List;
import java.util.function.IntFunction;
import java.util.stream.Stream;

import dao.ProductRepository;

public class checkProductId {
	public static void main(String[] args) {
		ProductRepository productRepository = ProductRepository.getInstance();
		List<Product> products = new ArrayList<Product>();

		Stream<Product> stream = products.stream();

		stream.toArray(new IntFunction<Integer[]>() {

			@Override
			public Integer[] apply(int value) {
				return null;
			}
		});

		/* function 이용하여 ID출력 */
		/* String productId = */
	}
}