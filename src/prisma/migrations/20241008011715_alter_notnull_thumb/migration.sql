-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_person" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tag" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "thumb" BLOB
);
INSERT INTO "new_person" ("id", "name", "tag", "thumb") SELECT "id", "name", "tag", "thumb" FROM "person";
DROP TABLE "person";
ALTER TABLE "new_person" RENAME TO "person";
CREATE UNIQUE INDEX "person_tag_key" ON "person"("tag");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
