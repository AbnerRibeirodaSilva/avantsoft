import { PrismaClient } from "@prisma/client";
import { Request, Response, Router } from "express";
import { authMiddleware } from "../middlewares/auth.middleware";

const prisma = new PrismaClient();
const router = Router();

router.use(authMiddleware);

router.get("/daily-sales", async (req: Request, res: Response) => {
  try {
    const raw = await prisma.sale.groupBy({
      by: ["date"],
      _sum: { value: true },
      orderBy: { date: "asc" },
    });

    const dailySales = raw.map(
      (entry: {
        date: { toISOString: () => string };
        _sum: { value: any };
      }) => ({
        date: entry.date.toISOString().split("T")[0],
        total: entry._sum.value ?? 0,
      })
    );

    res.json({ dailySales });
  } catch (error) {
    res.status(500).json({ message: "Erro ao calcular vendas diárias" });
  }
});

router.get("/highlights", async (req: Request, res: Response) => {
  try {
    const clients = await prisma.client.findMany({
      include: { sales: true },
    });

    if (clients.length === 0) {
      res.status(404).json({ message: "No clients found" });
    }

    const mostTotal = clients.reduce(
      (
        previous: { client: (typeof clients)[0]; total: number },
        current: (typeof clients)[0]
      ) => {
        const total = current.sales.reduce((sum, sale) => sum + sale.value, 0);
        return total > previous.total ? { client: current, total } : previous;
      },
      {
        client: clients[0],
        total: clients[0].sales.reduce((sum, sale) => sum + sale.value, 0),
      }
    );

    const mostAverage = clients.reduce(
      (previous: { client: (typeof clients)[0]; avarege: number }, current) => {
        const total = current.sales.reduce((sum, sale) => sum + sale.value, 0);
        const average = current.sales.length ? total / current.sales.length : 0;
        return average > previous.avarege
          ? { client: current, avarege: average }
          : previous;
      },
      { client: clients[0], avarege: 0 }
    );

    const mostFrequent = clients.reduce(
      (
        previous: { client: (typeof clients)[0]; frequency: number },
        current: (typeof clients)[0]
      ) => {
        const uniqueDays = new Set(
          current.sales.map((sale) => sale.date.toISOString().split("T")[0])
        );
        return uniqueDays.size > previous.frequency
          ? { client: current, frequency: uniqueDays.size }
          : previous;
      },
      { client: clients[0], frequency: clients[0].sales.length > 0 ? 1 : 0 }
    );

    res.json({
      mostTotal: {
        client: mostTotal.client,
        total: mostTotal.total,
      },
      mostAverage: {
        client: mostAverage.client,
        average: mostAverage.avarege,
      },
      mostFrequent: {
        client: mostFrequent.client,
        frequency: mostFrequent.frequency,
      },
    });
  } catch (error) {
    res.status(500).json({ message: "Error fetching highlights" });
  }
});

export default router;
