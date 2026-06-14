import { useLocation, useNavigate, Link } from "react-router-dom";
import "./OrderConfirmation.css";

function OrderConfirmation() {
  const { state } = useLocation();
  const navigate  = useNavigate();

  if (!state) {
    navigate("/");
    return null;
  }

  const { orderId, address, payment, grandTotal, totalItems } = state;

  const PAYMENT_LABELS = { cod: "Cash on Delivery", upi: "UPI", card: "Card", nb: "Net Banking" };

  const estimatedDate = new Date();
  estimatedDate.setDate(estimatedDate.getDate() + 5);
  const deliveryDate = estimatedDate.toLocaleDateString("en-IN", { weekday: "long", day: "numeric", month: "long" });

  return (
    <div className="oc-page">
      <div className="oc-card">

        <div className="oc-icon">✅</div>
        <h1 className="oc-title">Order Placed Successfully!</h1>
        <p className="oc-subtitle">Thank you for shopping with CityMall.</p>

        <div className="oc-order-id">
          Order ID: <strong>{orderId}</strong>
        </div>

        <div className="oc-details">

          <div className="oc-detail-row">
            <span className="oc-detail-label">Items</span>
            <span>{totalItems} item{totalItems > 1 ? "s" : ""}</span>
          </div>

          <div className="oc-detail-row">
            <span className="oc-detail-label">Amount Paid</span>
            <span className="oc-amount">₹{grandTotal.toLocaleString()}</span>
          </div>

          <div className="oc-detail-row">
            <span className="oc-detail-label">Payment</span>
            <span>{PAYMENT_LABELS[payment]}</span>
          </div>

          <div className="oc-detail-row">
            <span className="oc-detail-label">Delivering to</span>
            <span>{address.name}, {address.city}, {address.state}</span>
          </div>

          <div className="oc-detail-row">
            <span className="oc-detail-label">Estimated Delivery</span>
            <span className="oc-delivery-date">{deliveryDate}</span>
          </div>

        </div>

        <div className="oc-actions">
          <Link to="/orders" className="oc-btn-orders">View My Orders</Link>
          <Link to="/products" className="oc-btn-shop">Continue Shopping</Link>
        </div>

      </div>
    </div>
  );
}

export default OrderConfirmation;
