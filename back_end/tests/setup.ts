import { execSync } from "child_process";

beforeAll(async () => {
  execSync(
    "npx prisma migrate reset --force --skip-seed --schema=./prisma/schema.prisma"
  );
});

afterAll(async () => {});
