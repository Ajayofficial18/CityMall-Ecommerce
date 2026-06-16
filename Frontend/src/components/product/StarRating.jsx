import "./StarRating.css";

function StarRating({ rating, count }) {
  const stars = Array.from({ length: 5 }, (_, i) => {
    if (i + 1 <= Math.floor(rating)) return "full";
    if (i < rating) return "half";
    return "empty";
  });

  return (
    <div className="star-rating">
      <div className="stars">
        {stars.map((type, i) => (
          <span key={i} className={`star star-${type}`}>
            {type === "full" ? "★" : type === "half" ? "⯨" : "☆"}
          </span>
        ))}
      </div>
      <span className="star-score">{rating}</span>
      {count && <span className="star-count">({count.toLocaleString()})</span>}
    </div>
  );
}

export default StarRating;
