import { Link } from "react-router-dom";
import "./Footer.css";

function Footer() {
  return (
    <footer className="footer">

      <div className="footer-top">

        {/* Col 1 — Brand */}
        <div className="footer-col">
          <h3 className="footer-logo">City<span>Mall</span></h3>
          <p className="footer-tagline">
            Your one-stop destination for the best products at unbeatable prices. Fast delivery, easy returns.
          </p>
        </div>

        {/* Col 2 — Quick Links */}
        <div className="footer-col">
          <h4 className="footer-heading">Quick Links</h4>
          <ul className="footer-links">
            <li><Link to="/">Home</Link></li>
            <li><Link to="/products">All Products</Link></li>
            <li><Link to="/cart">Cart</Link></li>
            <li><Link to="/orders">My Orders</Link></li>
          </ul>
        </div>

        {/* Col 3 — Customer Service */}
        <div className="footer-col">
          <h4 className="footer-heading">Customer Service</h4>
          <ul className="footer-links">
            <li><Link to="/login">Sign In</Link></li>
            <li><Link to="/register">Create Account</Link></li>
            <li><a href="#">Help &amp; Support</a></li>
            <li><a href="#">Return Policy</a></li>
            <li><a href="#">Track Order</a></li>
          </ul>
        </div>

        {/* Col 4 — Connect */}
        <div className="footer-col">
          <h4 className="footer-heading">Connect With Us</h4>
          <div className="footer-socials">
            <a href="#" className="footer-social-btn">📘 Facebook</a>
            <a href="#" className="footer-social-btn">📸 Instagram</a>
            <a href="#" className="footer-social-btn">🐦 Twitter</a>
          </div>
          <p className="footer-contact">📧 support@citymall.com</p>
          <p className="footer-contact">📞 1800-123-4567</p>
        </div>

      </div>

      {/* Bottom Bar */}
      <div className="footer-bottom">
        <p>© {new Date().getFullYear()} CityMall. All rights reserved.</p>
        <div className="footer-bottom-links">
          <a href="#">Privacy Policy</a>
          <a href="#">Terms of Use</a>
          <a href="#">Sitemap</a>
        </div>
      </div>

    </footer>
  );
}

export default Footer;
