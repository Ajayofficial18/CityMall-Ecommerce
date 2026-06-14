import { useState } from "react";
import { Link, useNavigate, useLocation } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import "./Auth.css";

function Login() {
  const navigate              = useNavigate();
  const location              = useLocation();
  const { login }             = useAuth();
  const redirectTo            = location.state?.from || "/";

  const [form, setForm]             = useState({ email: "", password: "" });
  const [showPassword, setShowPassword] = useState(false);
  const [error, setError]           = useState("");

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
    setError("");
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!form.email || !form.password) {
      setError("Please fill in all fields.");
      return;
    }
    const result = login(form.email, form.password);
    if (result.success) navigate(redirectTo, { replace: true });
    else setError("Invalid email or password.");
  };

  return (
    <div className="auth-page">
      <div className="auth-card">

        <Link to="/" className="auth-logo">City<span>Mall</span></Link>

        <h2 className="auth-title">Sign In</h2>

        {error && <p className="auth-error">{error}</p>}

        <form onSubmit={handleSubmit} className="auth-form">

          <div className="auth-field">
            <label>Email</label>
            <input
              type="email"
              name="email"
              placeholder="Enter your email"
              value={form.email}
              onChange={handleChange}
              autoComplete="email"
            />
          </div>

          <div className="auth-field">
            <label>Password</label>
            <div className="auth-password-wrapper">
              <input
                type={showPassword ? "text" : "password"}
                name="password"
                placeholder="Enter your password"
                value={form.password}
                onChange={handleChange}
                autoComplete="current-password"
              />
              <button
                type="button"
                className="auth-toggle-password"
                onClick={() => setShowPassword(!showPassword)}
              >
                {showPassword ? "🙈" : "👁️"}
              </button>
            </div>
            <Link to="/forgot-password" className="auth-forgot">Forgot password?</Link>
          </div>

          <button type="submit" className="auth-submit-btn">
            Sign In
          </button>

        </form>

        <p className="auth-switch">
          New to CityMall? <Link to="/register">Create an account</Link>
        </p>

      </div>
    </div>
  );
}

export default Login;
