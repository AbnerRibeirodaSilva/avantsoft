import { PrismaClient } from "@prisma/client";
import request from "supertest";
import app from "../src/server";

const prisma = new PrismaClient();

describe("Auth Routes", () => {
  it("should return token for valid credentials", async () => {
    const res = await request(app).post("/auth/login").send({
      email: "abner@gmail.com",
      password: "123456",
    });

    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty("token");
  });

  it("should fail with invalid password", async () => {
    const res = await request(app).post("/auth/login").send({
      email: "admin@admin.com",
      password: "wrongpass",
    });

    expect(res.statusCode).toBe(401);
  });

  it("should fail with unknown user", async () => {
    const res = await request(app).post("/auth/login").send({
      email: "notfound@example.com",
      password: "123456",
    });

    expect(res.statusCode).toBe(401);
  });
});
