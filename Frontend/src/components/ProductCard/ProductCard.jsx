import { Link } from "react-router-dom";
import { useCart } from "../../context/CartContext";
import StarRating from "../product/StarRating";
import "./ProductCard.css";

const ProductCard = ({ product }) => {

  const { addToCart } = useCart();

  return (
    <div className="product-card">

      {product.discount && (
        <div className="product-discount-tag">{product.discount}% OFF</div>
      )}

      <Link to={`/product/${product.id}`}>
        <div className="product-image-wrapper">
          <img src={product.image} alt={product.name} />
        </div>
        <p className="product-name">{product.name}</p>
        {product.brand && <p className="product-brand">{product.brand}</p>}
        {product.rating && (
          <StarRating rating={product.rating} count={product.ratingCount} />
        )}
      </Link>

      <div className="product-price">
        <span className="product-price-current">₹{product.price}</span>
        {product.mrp && (
          <span className="product-price-mrp">₹{product.mrp}</span>
        )}
      </div>

      <button className="product-add-btn" onClick={() => addToCart(product)}>
        Add to Cart
      </button>

    </div>
  );
};

export default ProductCard;
