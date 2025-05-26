import { PrismaClient } from "@prisma/client";
import { Request, Response, Router } from "express";
import { authMiddleware } from "../middlewares/auth.middleware";

const prisma = new PrismaClient();

const router: Router = Router();

router.use(authMiddleware);

router.get("/", async (req: Request, res: Response) => {
  const { findByName, findByEmail } = req.query;

  try {
    const clients = await prisma.client.findMany({
      where: {
        name: findByName ? { contains: String(findByName) } : undefined,
        email: findByEmail ? { contains: String(findByEmail) } : undefined,
      },
    });

    res.json({ clients });
  } catch (error) {
    console.error("Erro aqui", error);
    res.status(500).json({ message: "Error fetching clients" });
  }
});

router.post("/", async (req: Request, res: Response) => {
  const { name, email, birthdate } = req.body;

  if (!name || !email || !birthdate) {
    res.status(400).json({ message: "All fields are required" });
  }

  try {
    const client = await prisma.client.create({
      data: {
        name,
        email,
        birthdate: new Date(birthdate),
      },
    });
    res.status(201).json(client);
  } catch (error) {
    res.status(500).json({ message: "Error creating client" });
  }
});

router.patch("/:id", async (req: Request, res: Response) => {
  const { id } = req.params;
  const { name, email, birthdate } = req.body;

  const data: any = {};
  if (name) data.name = name;
  if (email) data.email = email;
  if (birthdate) data.birthdate = new Date(birthdate);

  if (Object.keys(data).length === 0) {
    res.status(400).json({ message: "No fields to update" });
  }

  try {
    const client = await prisma.client.update({
      where: { id },
      data,
    });

    res.json(client);
  } catch (error) {
    res.status(500).json({ message: "Error updating client" });
  }
});

router.delete("/:id", async (req: Request, res: Response) => {
  const { id } = req.params;

  try {
    await prisma.client.delete({
      where: { id },
    });

    res.status(200).json({ message: "Client deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: "Error deleting client" });
  }
});

export default router;
