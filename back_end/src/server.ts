import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import morgan from "morgan";
import authRoutes from "./routes/auth.routes";
import clientRoutes from "./routes/client.routes";
import saleRoutes from "./routes/sale.routes";
import statisticsRoutes from "./routes/statistics.routes";

dotenv.config();
const app = express();

app.use(cors());
app.use(morgan("dev"));
app.use(express.json());

app.use("/auth", authRoutes);
app.use("/clients", clientRoutes);
app.use("/sales", saleRoutes);
app.use("/statistics", statisticsRoutes);

export default app;

if (require.main === module) {
  const PORT = 3333;
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}
