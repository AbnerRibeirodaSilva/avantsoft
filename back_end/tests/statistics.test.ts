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
      name: "Cliente Estatístico",
      email: "stat@test.com",
      birthdate: "10/10/1990",
    });

  clientId = clientRes.body.id;

  await prisma.sale.createMany({
    data: [
      {
        clientId,
        value: 100,
        date: new Date("2025/01/01"),
      },
      {
        clientId,
        value: 50,
        date: new Date("2025/01/01"),
      },
      {
        clientId,
        value: 200,
        date: new Date("2025/01/02"),
      },
    ],
  });
});

afterAll(async () => {
  await prisma.$disconnect();
});

describe("Statistics Routes", () => {
  it("should return daily sales totals", async () => {
    const res = await request(app)
      .get("/statistics/daily-sales")
      .set("Authorization", `Bearer ${token}`);

    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body.dailySales)).toBe(true);
    expect(res.body.dailySales).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          date: "2025-01-01",
          total: 150,
        }),
        expect.objectContaining({
          date: "2025-01-02",
          total: 200,
        }),
      ])
    );
  });

  it("should return sales highlights", async () => {
    const res = await request(app)
      .get("/statistics/highlights")
      .set("Authorization", `Bearer ${token}`);

    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty("mostTotal");
    expect(res.body).toHaveProperty("mostAverage");
    expect(res.body).toHaveProperty("mostFrequent");

    expect(res.body.mostTotal.total).toBeGreaterThan(0);
    expect(res.body.mostAverage.average).toBeGreaterThan(0);
    expect(res.body.mostFrequent.frequency).toBeGreaterThan(0);
  });
});
