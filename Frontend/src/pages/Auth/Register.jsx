import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import "./Auth.css";

function Register() {
  const navigate      = useNavigate();
  const { register }  = useAuth();
  const [form, setForm] = useState({ name: "", email: "", password: "", confirmPassword: "" });
  const [showPassword, setShowPassword] = useState(false);
  const [errors, setErrors] = useState({});

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
    setErrors({ ...errors, [e.target.name]: "" });
  };

  const validate = () => {
    const newErrors = {};
    if (!form.name.trim())        newErrors.name    = "Name is required.";
    if (!form.email.trim())       newErrors.email   = "Email is required.";
    if (form.password.length < 6) newErrors.password = "Password must be at least 6 characters.";
    if (form.password !== form.confirmPassword) newErrors.confirmPassword = "Passwords do not match.";
    return newErrors;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const newErrors = validate();
    if (Object.keys(newErrors).length > 0) { setErrors(newErrors); return; }
    register(form.name, form.email);
    navigate("/");
  };

  return (
    <div className="auth-page">
      <div className="auth-card">

        <Link to="/" className="auth-logo">City<span>Mall</span></Link>

        <h2 className="auth-title">Create Account</h2>

        <form onSubmit={handleSubmit} className="auth-form">

          <div className="auth-field">
            <label>Full Name</label>
            <input
              type="text"
              name="name"
              placeholder="Enter your full name"
              value={form.name}
              onChange={handleChange}
              autoComplete="name"
            />
            {errors.name && <span className="auth-field-error">{errors.name}</span>}
          </div>

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
            {errors.email && <span className="auth-field-error">{errors.email}</span>}
          </div>

          <div className="auth-field">
            <label>Password</label>
            <div className="auth-password-wrapper">
              <input
                type={showPassword ? "text" : "password"}
                name="password"
                placeholder="At least 6 characters"
                value={form.password}
                onChange={handleChange}
                autoComplete="new-password"
              />
              <button
                type="button"
                className="auth-toggle-password"
                onClick={() => setShowPassword(!showPassword)}
              >
                {showPassword ? "🙈" : "👁️"}
              </button>
            </div>
            {errors.password && <span className="auth-field-error">{errors.password}</span>}
          </div>

          <div className="auth-field">
            <label>Confirm Password</label>
            <input
              type={showPassword ? "text" : "password"}
              name="confirmPassword"
              placeholder="Re-enter your password"
              value={form.confirmPassword}
              onChange={handleChange}
              autoComplete="new-password"
            />
            {errors.confirmPassword && <span className="auth-field-error">{errors.confirmPassword}</span>}
          </div>

          <button type="submit" className="auth-submit-btn">
            Create Account
          </button>

        </form>

        <p className="auth-switch">
          Already have an account? <Link to="/login">Sign in</Link>
        </p>

      </div>
    </div>
  );
}

export default Register;
