/*
  Warnings:

  - You are about to drop the column `defence` on the `BowStats` table. All the data in the column will be lost.
  - You are about to drop the column `evadeChance` on the `BowStats` table. All the data in the column will be lost.
  - Added the required column `damage` to the `BowStats` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "BowStats" DROP COLUMN "defence",
DROP COLUMN "evadeChance",
ADD COLUMN     "criticalMultiplier" DOUBLE PRECISION,
ADD COLUMN     "damage" TEXT NOT NULL,
ADD COLUMN     "hitChance" DOUBLE PRECISION,
ADD COLUMN     "power" DOUBLE PRECISION;
