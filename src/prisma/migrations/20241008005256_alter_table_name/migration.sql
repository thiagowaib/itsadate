/*
  Warnings:

  - You are about to drop the `Person` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Person";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "person" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tag" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "person_tag_key" ON "person"("tag");
