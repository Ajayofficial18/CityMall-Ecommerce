import { useNavigate } from "react-router-dom";
import "./Orders.css";

// Dummy orders — replace with API call when backend is ready
const DUMMY_ORDERS = [
  {
    id: "CM20240001",
    date: "12 June 2025",
    status: "Delivered",
    total: 5498,
    items: [
      { name: "Wireless Noise-Cancelling Headphones", qty: 1, price: 2999, image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&q=80" },
      { name: "Portable Bluetooth Speaker", qty: 1, price: 1799, image: "https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400&q=80" },
    ],
  },
  {
    id: "CM20240002",
    date: "18 June 2025",
    status: "Out for Delivery",
    total: 3499,
    items: [
      { name: "Smart Fitness Watch", qty: 1, price: 3499, image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&q=80" },
    ],
  },
  {
    id: "CM20240003",
    date: "22 June 2025",
    status: "Processing",
    total: 2098,
    items: [
      { name: "Stainless Steel Water Bottle", qty: 1, price: 599, image: "https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=400&q=80" },
      { name: "Yoga Mat Premium", qty: 1, price: 899, image: "https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=400&q=80" },
      { name: "Face Moisturizer SPF 50", qty: 1, price: 449, image: "https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=400&q=80" },
    ],
  },
];

const STATUS_COLORS = {
  "Delivered":        { bg: "#e8f5e9", color: "#2e7d32" },
  "Out for Delivery": { bg: "#fff3e0", color: "#e65100" },
  "Processing":       { bg: "#e3f2fd", color: "#1565c0" },
  "Cancelled":        { bg: "#fdecea", color: "#c62828" },
};

function Orders() {
  const navigate = useNavigate();

  return (
    <div className="container orders-page">

      <h2 className="orders-title">My Orders</h2>

      {DUMMY_ORDERS.length === 0 ? (
        <div className="orders-empty">
          <span>📦</span>
          <p>No orders yet.</p>
          <button onClick={() => navigate("/products")}>Start Shopping</button>
        </div>
      ) : (
        <div className="orders-list">
          {DUMMY_ORDERS.map((order) => {
            const statusStyle = STATUS_COLORS[order.status] || {};
            return (
              <div key={order.id} className="order-card">

                {/* Header */}
                <div className="order-card-header">
                  <div>
                    <p className="order-id">Order # {order.id}</p>
                    <p className="order-date">Placed on {order.date}</p>
                  </div>
                  <div className="order-header-right">
                    <span
                      className="order-status"
                      style={{ background: statusStyle.bg, color: statusStyle.color }}
                    >
                      {order.status}
                    </span>
                    <span className="order-total">₹{order.total.toLocaleString()}</span>
                  </div>
                </div>

                {/* Items */}
                <div className="order-items">
                  {order.items.map((item, i) => (
                    <div key={i} className="order-item">
                      <img src={item.image} alt={item.name} />
                      <div>
                        <p className="order-item-name">{item.name}</p>
                        <p className="order-item-meta">Qty: {item.qty} · ₹{item.price.toLocaleString()}</p>
                      </div>
                    </div>
                  ))}
                </div>

              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}

export default Orders;
