package it.vscalcione.springboot.docker.demoapplication.services;

import it.vscalcione.springboot.docker.demoapplication.commands.ProductForm;
import it.vscalcione.springboot.docker.demoapplication.domain.Product;

import java.util.List;

public interface ProductService {
    List<Product> listAll();
    Product getById(String id);
    Product saveOrUpdate(Product product);
    void delete(String id);
    Product saveOrUpdateProductForm(ProductForm productForm);
}
