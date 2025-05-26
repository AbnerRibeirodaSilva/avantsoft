import { PrismaClient } from "@prisma/client";
import { Request, Response, Router } from "express";
import { authMiddleware } from "../middlewares/auth.middleware";

const router = Router();

const prisma = new PrismaClient();

router.use(authMiddleware);

router.get("/", async (req: Request, res: Response) => {
  try {
    const salesList = await prisma.sale.findMany({
      include: {
        client: true,
      },
    });
    res.json(salesList);
  } catch (error) {
    res.status(500).json({ message: "Error fetching sales" });
  }
});

router.post("/", async (req: Request, res: Response) => {
  const { clientId, value, date } = req.body;

  if (!clientId || !value || !date) {
    res.status(400).json({ message: "All fields are required" });
    return;
  }

  try {
    const clientExists = await prisma.client.findUnique({
      where: { id: clientId },
    });

    if (!clientExists) {
      res.status(400).json({ message: "Client not found" });
      return;
    }
    const sale = await prisma.sale.create({
      data: {
        clientId,
        value,
        date: new Date(date),
      },
    });

    res.status(201).json(sale);
  } catch (error) {
    res.status(500).json({ message: "Error creating sale" });
  }
});

export default router;
