import bcrypt from "bcrypt";
import { Request, Response, Router } from "express";
import jwt from "jsonwebtoken";

const router = Router();

const mockUser = {
  email: "abner@gmail.com",
  passwordHash: bcrypt.hashSync("123456", 10),
};

router.post("/login", async (req: Request, res: Response) => {
  const { email, password }: { email: string; password: string } = req.body;

  if (email !== mockUser.email) {
    res.status(401).json({ message: "invalid user or password" });
  }

  const isValid = await bcrypt.compare(password, mockUser.passwordHash);
  if (!isValid) {
    res.status(401).json({ message: "invalid user or password" });
  }

  const token = jwt.sign({ email }, process.env.JWT_SECRET!, {
    expiresIn: "1d",
  });

  res.status(200).json({ token });
});

export default router;
