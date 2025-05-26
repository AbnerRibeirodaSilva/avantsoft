import { PrismaClient } from "@prisma/client";

import request from "supertest";
import app from "../src/server";

const prisma = new PrismaClient();

let token: string;

beforeAll(async () => {
  await prisma.sale.deleteMany();
  await prisma.client.deleteMany();
  const res = await request(app).post("/auth/login").send({
    email: "abner@gmail.com",
    password: "123456",
  });
  token = res.body.token;
});

afterAll(async () => {
  await prisma.client.deleteMany();
  await prisma.$disconnect();
});

describe("Client Routes", () => {
  let clientId: string;

  it("should create a new client", async () => {
    const res = await request(app)
      .post("/clients")
      .set("Authorization", `Bearer ${token}`)
      .send({
        name: "Client Test",
        email: "test@test.com",
        birthdate: "2000/11/18",
      });
    expect(res.statusCode).toBe(201);
    expect(res.body).toHaveProperty("id");
    clientId = res.body.id;
  });

  it("should list clients", async () => {
    const res = await request(app)
      .get("/clients")
      .set("Authorization", `Bearer ${token}`);

    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body.clients)).toBe(true);
    expect(res.body.clients.length).toBeGreaterThan(0);
  });

  it("should find clients by name", async () => {
    const res = await request(app)
      .get("/clients")
      .set("Authorization", `Bearer ${token}`)
      .query({ findByName: "Client" });

    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body.clients)).toBe(true);
    expect(res.body.clients.length).toBeGreaterThan(0);
  });

  it("should update a client", async () => {
    const res = await request(app)
      .patch(`/clients/${clientId}`)
      .set("Authorization", `Bearer ${token}`)
      .send({ name: "Updated client" });

    expect(res.statusCode).toBe(200);
    expect(res.body.name).toBe("Updated client");
  });

  it("should delete a client", async () => {
    const res = await request(app)
      .delete(`/clients/${clientId}`)
      .set("Authorization", `Bearer ${token}`);

    expect(res.statusCode).toBe(200);
    expect(res.body.message).toMatch("Client deleted successfully");
  });

  it("should fail without token", async () => {
    const res = await request(app).get("/clients");
    expect(res.statusCode).toBe(401);
  });

  it("should fail with invalid data", async () => {
    const res = await request(app)
      .post("/clients")
      .set("Authorization", `Bearer ${token}`)
      .send({
        name: "",
        email: "fail@fail.com",
        birthdate: "2000/11/12",
      });

    expect(res.statusCode).toBe(400);
  });
});
