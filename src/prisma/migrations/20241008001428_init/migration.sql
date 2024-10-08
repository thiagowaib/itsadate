-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tag" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_tag_key" ON "User"("tag");
