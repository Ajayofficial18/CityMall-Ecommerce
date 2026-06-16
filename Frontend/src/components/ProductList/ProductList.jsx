import { useNavigate } from "react-router-dom";
import ProductCard from "../ProductCard/ProductCard";
import "./ProductList.css";

const ProductList = ({ title, products }) => {

  const navigate = useNavigate();

  return (
    <div className="product-list">
      <div className="product-list-header">
        <h2>{title}</h2>
        <button onClick={() => navigate("/products")}>View All</button>
      </div>
      <div className="product-list-scroll">
        {products.map((item) => (
          <ProductCard key={item.id} product={item} />
        ))}
      </div>
    </div>
  );
};

export default ProductList;