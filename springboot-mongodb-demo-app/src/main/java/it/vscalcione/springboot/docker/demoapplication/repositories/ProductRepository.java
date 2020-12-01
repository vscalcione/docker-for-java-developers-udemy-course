package it.vscalcione.springboot.docker.demoapplication.repositories;

import it.vscalcione.springboot.docker.demoapplication.domain.Product;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepository extends CrudRepository<Product, String> {
}
