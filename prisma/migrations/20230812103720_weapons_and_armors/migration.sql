-- CreateEnum
CREATE TYPE "HelmetType" AS ENUM ('FULL_FACE', 'LARGE', 'MEDIUM', 'SMALL');

-- AlterTable
ALTER TABLE "WeaponStats" ALTER COLUMN "hitChance" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "power" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "criticalChance" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "counterAttackChance" SET DATA TYPE DOUBLE PRECISION;

-- CreateTable
CREATE TABLE "Helmet" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" "HelmetType" NOT NULL,
    "large" BOOLEAN DEFAULT false,
    "imageSrc" TEXT NOT NULL,

    CONSTRAINT "Helmet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HelmetStats" (
    "id" SERIAL NOT NULL,
    "defence" INTEGER NOT NULL,
    "evadeChance" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,
    "helmetId" INTEGER NOT NULL,

    CONSTRAINT "HelmetStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Armor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Armor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArmorImageUrls" (
    "id" SERIAL NOT NULL,
    "body" TEXT NOT NULL,
    "leftArm" TEXT,
    "leftHand" TEXT,
    "leftLeg" TEXT NOT NULL,
    "rightArm" TEXT,
    "rightHand" TEXT,
    "rightLeg" TEXT NOT NULL,
    "armorId" INTEGER NOT NULL,

    CONSTRAINT "ArmorImageUrls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArmorStats" (
    "id" SERIAL NOT NULL,
    "defence" INTEGER NOT NULL,
    "evadeChance" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,
    "armorId" INTEGER NOT NULL,

    CONSTRAINT "ArmorStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Shield" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "imageSrc" TEXT NOT NULL,

    CONSTRAINT "Shield_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShieldStats" (
    "id" SERIAL NOT NULL,
    "defence" INTEGER NOT NULL,
    "evadeChance" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,
    "shieldId" INTEGER NOT NULL,

    CONSTRAINT "ShieldStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bow" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Bow_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BowImageUrls" (
    "id" SERIAL NOT NULL,
    "bowStem" TEXT NOT NULL,
    "bowString" TEXT NOT NULL,
    "drawnBowString" TEXT NOT NULL,
    "quiver" TEXT NOT NULL,
    "arrow" TEXT NOT NULL,
    "bowId" INTEGER NOT NULL,

    CONSTRAINT "BowImageUrls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BowStats" (
    "id" SERIAL NOT NULL,
    "defence" INTEGER NOT NULL,
    "evadeChance" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,
    "bowId" INTEGER NOT NULL,

    CONSTRAINT "BowStats_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Helmet_name_key" ON "Helmet"("name");

-- CreateIndex
CREATE UNIQUE INDEX "HelmetStats_helmetId_key" ON "HelmetStats"("helmetId");

-- CreateIndex
CREATE UNIQUE INDEX "Armor_name_key" ON "Armor"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ArmorImageUrls_armorId_key" ON "ArmorImageUrls"("armorId");

-- CreateIndex
CREATE UNIQUE INDEX "ArmorStats_armorId_key" ON "ArmorStats"("armorId");

-- CreateIndex
CREATE UNIQUE INDEX "Shield_name_key" ON "Shield"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ShieldStats_shieldId_key" ON "ShieldStats"("shieldId");

-- CreateIndex
CREATE UNIQUE INDEX "Bow_name_key" ON "Bow"("name");

-- CreateIndex
CREATE UNIQUE INDEX "BowImageUrls_bowId_key" ON "BowImageUrls"("bowId");

-- CreateIndex
CREATE UNIQUE INDEX "BowStats_bowId_key" ON "BowStats"("bowId");

-- AddForeignKey
ALTER TABLE "HelmetStats" ADD CONSTRAINT "HelmetStats_helmetId_fkey" FOREIGN KEY ("helmetId") REFERENCES "Helmet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArmorImageUrls" ADD CONSTRAINT "ArmorImageUrls_armorId_fkey" FOREIGN KEY ("armorId") REFERENCES "Armor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArmorStats" ADD CONSTRAINT "ArmorStats_armorId_fkey" FOREIGN KEY ("armorId") REFERENCES "Armor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShieldStats" ADD CONSTRAINT "ShieldStats_shieldId_fkey" FOREIGN KEY ("shieldId") REFERENCES "Shield"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BowImageUrls" ADD CONSTRAINT "BowImageUrls_bowId_fkey" FOREIGN KEY ("bowId") REFERENCES "Bow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BowStats" ADD CONSTRAINT "BowStats_bowId_fkey" FOREIGN KEY ("bowId") REFERENCES "Bow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
