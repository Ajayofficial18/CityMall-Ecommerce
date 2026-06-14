import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import ProductList from "../../components/ProductList/ProductList";
import { fetchProducts } from "../../services/productService";
import "./Home.css";

const CATEGORIES = [
  { label: "Electronics", icon: "📱" },
  { label: "Fashion", icon: "👗" },
  { label: "Grocery", icon: "🛒" },
  { label: "Home", icon: "🏠" },
  { label: "Sports", icon: "⚽" },
  { label: "Beauty", icon: "💄" },
  { label: "Toys", icon: "🧸" },
  { label: "Books", icon: "📚" },
];

function Home() {
  const [products, setProducts] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    fetchProducts().then(setProducts).catch(console.error);
  }, []);

  return (
    <div>

      {/* Hero Banner */}
      <div className="hero-banner">
        <div className="hero-content">
          <p className="hero-subtitle">Welcome to CityMall</p>
          <h1 className="hero-title">Shop Everything,<br />Delivered Fast.</h1>
          <button className="hero-cta" onClick={() => navigate("/products")}>
            Shop Now
          </button>
        </div>
      </div>

      <div className="container">

        {/* Categories */}
        <section className="categories-section">
          <h2 className="section-title">Shop by Category</h2>
          <div className="categories-row">
            {CATEGORIES.map((cat) => (
              <button
                key={cat.label}
                className="category-chip"
                onClick={() => navigate(`/products?q=${cat.label}`)}
              >
                <span className="category-icon">{cat.icon}</span>
                <span>{cat.label}</span>
              </button>
            ))}
          </div>
        </section>

        {/* Today's Deals */}
        <section className="home-section">
          <ProductList title="🔥 Today's Deals" products={products} />
        </section>

        {/* New Arrivals */}
        <section className="home-section">
          <ProductList title="✨ New Arrivals" products={[...products].reverse()} />
        </section>

      </div>
    </div>
  );
}

export default Home;
