/*
  Warnings:

  - Added the required column `thumb` to the `person` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_person" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tag" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "thumb" BLOB NOT NULL
);
INSERT INTO "new_person" ("id", "name", "tag") SELECT "id", "name", "tag" FROM "person";
DROP TABLE "person";
ALTER TABLE "new_person" RENAME TO "person";
CREATE UNIQUE INDEX "person_tag_key" ON "person"("tag");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
