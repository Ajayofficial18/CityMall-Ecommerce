import { useNavigate } from "react-router-dom";
import { useCart } from "../../context/CartContext";
import "./Cart.css";

const DELIVERY_THRESHOLD = 500;
const DELIVERY_CHARGE = 49;

function Cart() {
  const { cartItems, removeFromCart, increaseQty, decreaseQty } = useCart();
  const navigate = useNavigate();

  if (cartItems.length === 0) {
    return (
      <div className="cart-empty">
        <span className="cart-empty-icon">🛒</span>
        <h2>Your cart is empty</h2>
        <p>Looks like you haven't added anything yet.</p>
        <button className="cart-shop-btn" onClick={() => navigate("/products")}>
          Shop Now
        </button>
      </div>
    );
  }

  const mrpTotal      = cartItems.reduce((sum, item) => sum + (item.mrp || item.price) * item.quantity, 0);
  const priceTotal    = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  const totalDiscount = mrpTotal - priceTotal;
  const delivery      = priceTotal >= DELIVERY_THRESHOLD ? 0 : DELIVERY_CHARGE;
  const grandTotal    = priceTotal + delivery;
  const totalItems    = cartItems.reduce((sum, item) => sum + item.quantity, 0);

  return (
    <div className="container cart-wrapper">

      {/* Left — Items */}
      <div className="cart-items-section">
        <h2 className="cart-title">Shopping Cart <span>({totalItems} item{totalItems > 1 ? "s" : ""})</span></h2>

        {cartItems.map((item) => (
          <div key={item.id} className="cart-card">

            {/* Image */}
            <img
              src={item.image}
              alt={item.name}
              className="cart-card-image"
              onClick={() => navigate(`/product/${item.id}`)}
            />

            {/* Details */}
            <div className="cart-card-details">
              <p className="cart-card-name" onClick={() => navigate(`/product/${item.id}`)}>
                {item.name}
              </p>
              {item.brand && <p className="cart-card-brand">{item.brand}</p>}

              <div className="cart-card-price-row">
                <span className="cart-card-price">₹{item.price.toLocaleString()}</span>
                {item.mrp && (
                  <span className="cart-card-mrp">₹{item.mrp.toLocaleString()}</span>
                )}
                {item.discount && (
                  <span className="cart-card-discount">{item.discount}% off</span>
                )}
              </div>

              {/* Qty Controls */}
              <div className="cart-qty-row">
                <div className="cart-qty-controls">
                  <button onClick={() => decreaseQty(item.id)}>−</button>
                  <span>{item.quantity}</span>
                  <button onClick={() => increaseQty(item.id)}>+</button>
                </div>
                <button className="cart-remove-btn" onClick={() => removeFromCart(item.id)}>
                  Remove
                </button>
              </div>
            </div>

            {/* Item Subtotal */}
            <div className="cart-card-subtotal">
              ₹{(item.price * item.quantity).toLocaleString()}
            </div>

          </div>
        ))}
      </div>

      {/* Right — Order Summary */}
      <aside className="cart-summary">
        <h3 className="cart-summary-title">Order Summary</h3>

        <div className="cart-summary-row">
          <span>Price ({totalItems} item{totalItems > 1 ? "s" : ""})</span>
          <span>₹{mrpTotal.toLocaleString()}</span>
        </div>
        <div className="cart-summary-row cart-summary-discount">
          <span>Discount</span>
          <span>− ₹{totalDiscount.toLocaleString()}</span>
        </div>
        <div className="cart-summary-row">
          <span>Delivery</span>
          <span>{delivery === 0 ? <span className="cart-free">FREE</span> : `₹${delivery}`}</span>
        </div>

        {delivery > 0 && (
          <p className="cart-delivery-note">
            Add ₹{(DELIVERY_THRESHOLD - priceTotal).toLocaleString()} more for free delivery
          </p>
        )}

        <hr className="cart-summary-divider" />

        <div className="cart-summary-row cart-summary-total">
          <span>Total Amount</span>
          <span>₹{grandTotal.toLocaleString()}</span>
        </div>

        {totalDiscount > 0 && (
          <p className="cart-summary-savings">
            🎉 You save ₹{totalDiscount.toLocaleString()} on this order
          </p>
        )}

        <button
          className="cart-checkout-btn"
          onClick={() => navigate("/checkout")}
        >
          Proceed to Checkout
        </button>

        <button
          className="cart-continue-btn"
          onClick={() => navigate("/products")}
        >
          Continue Shopping
        </button>
      </aside>

    </div>
  );
}

export default Cart;
