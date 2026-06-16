import API from "../api/api";
import dummyProducts from "../data/products";

export const fetchProducts = async () => {
  try {
    const response = await API.get("/api/v1/products");
    return response.data.data;
  } catch {
    return dummyProducts;
  }
};

export const fetchProductById = async (id) => {
  try {
    const response = await API.get(`/api/v1/products/${id}`);
    return response.data.data;
  } catch {
    return dummyProducts.find((p) => p.id === parseInt(id)) || null;
  }
};
