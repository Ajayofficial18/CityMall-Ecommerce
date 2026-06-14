import axios from "axios";

const API = axios.create({
  baseURL: "http://localhost:8222"
});

export default API;