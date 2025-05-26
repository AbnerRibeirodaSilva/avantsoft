import { PrismaClient } from "@prisma/client";
import request from "supertest";
import app from "../src/server";

const prisma = new PrismaClient();

let token: string;
let clientId: string;

beforeAll(async () => {
  await prisma.sale.deleteMany();
  await prisma.client.deleteMany();

  const loginRes = await request(app)
    .post("/auth/login")
    .send({ email: "abner@gmail.com", password: "123456" });

  token = loginRes.body.token;

  const clientRes = await request(app)
    .post("/clients")
    .set("Authorization", `Bearer ${token}`)
    .send({
      name: "Client test",
      email: "client@sales.com",
      birthdate: "2000/11/18",
    });

  clientId = clientRes.body.id;
});

afterAll(async () => {
  await prisma.$disconnect();
});

describe("Sales Routes", () => {
  it("should create a new sale", async () => {
    const res = await request(app)
      .post("/sales")
      .set("Authorization", `Bearer ${token}`)
      .send({
        clientId,
        value: 100.0,
        date: "2025/05/24",
      });

    expect(res.statusCode).toBe(201);
    expect(res.body).toHaveProperty("id");
  });

  it("should list all sales", async () => {
    const res = await request(app)
      .get("/sales")
      .set("Authorization", `Bearer ${token}`);

    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
  });

  it("should fail with invalid clientId", async () => {
    const res = await request(app)
      .post("/sales")
      .set("Authorization", `Bearer ${token}`)
      .send({
        clientId: "invalid-id",
        value: 50.0,
        date: "2024-01-01",
      });

    expect(res.statusCode).toBe(400);
  });
});
