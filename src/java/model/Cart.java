/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    // tra ve so luong cua 1 san pham khi day vao gio hang
    public int getQuantityByID(int id) {
        Item item = getItemByID(id);
        if (item != null) {
            return item.getQuantity();
        } else {
            // Xử lý trường hợp không tìm thấy mặt hàng với ID tương ứng
            return 0; // hoặc trả về giá trị mặc định khác tùy thuộc vào yêu cầu của bạn
        }
    }

    // tim ra item by id
    public Item getItemByID(int id) {
        for (Item item : items) {
            if (item.getProduct().getId() == id) {
                return item;
            }
        }
        return null;
    }

    // them san pham vao gio hang
    public void addItem(Item t) {
        if (getItemByID(t.getProduct().getId()) != null) {
            Item m = getItemByID(t.getProduct().getId());
            m.setQuantity(t.getQuantity() + m.getQuantity());
        } else {
            items.add(t);
        }
    }

    // xoa don hang
    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }

    public float getTotalMoney() {
        float t = 0;
        for (Item item : items) {
            t += (item.getPrice() * item.getQuantity());
        }
        return t;
    }

    public Product getProductByID(int id, List<Product> list) {
        for (Product pro : list) {
            if (pro.getId() == id) {
                return pro;
            }
        }
        return null;
    }

    // danh sách gior hàng trong cookie
    public Cart(String txt, List<Product> listp) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product product = getProductByID(id, listp);
                    if (product != null) {
                        Item t = new Item(product, quantity, product.getPrice()); // Sử dụng giá trị thực sự của sản phẩm
                        addItem(t);
                    }
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }
    }
}
