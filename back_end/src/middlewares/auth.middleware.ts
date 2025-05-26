import { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";

export function authMiddleware(
  req: Request,
  res: Response,
  next: NextFunction
): void {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    res.status(401).json({ message: "Authorization header missing" });
    return;
  }

  const [, token] = authHeader.split(" ");

  try {
    const jwtSecret = process.env.JWT_SECRET;
    if (!jwtSecret) {
      res.status(500).json({ message: "Internal server error" });
      return;
    }
    const decoded = jwt.verify(token, jwtSecret);
    (req as any).user = decoded;
    next();
  } catch {
    res.status(401).json({ message: "Unauthorizedd" });
    return;
  }
}
