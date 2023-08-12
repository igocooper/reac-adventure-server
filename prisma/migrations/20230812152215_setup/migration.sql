-- CreateEnum
CREATE TYPE "HelmetType" AS ENUM ('FULL_FACE', 'LARGE', 'MEDIUM', 'SMALL');

-- CreateTable
CREATE TABLE "Weapon" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "imageSrc" TEXT NOT NULL,
    "statsId" INTEGER NOT NULL,

    CONSTRAINT "Weapon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WeaponStats" (
    "id" SERIAL NOT NULL,
    "damage" TEXT NOT NULL,
    "hitChance" DOUBLE PRECISION,
    "power" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "criticalMultiplier" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,

    CONSTRAINT "WeaponStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Helmet" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" "HelmetType" NOT NULL,
    "large" BOOLEAN DEFAULT false,
    "imageSrc" TEXT NOT NULL,
    "statsId" INTEGER NOT NULL,

    CONSTRAINT "Helmet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HelmetStats" (
    "id" SERIAL NOT NULL,
    "defence" INTEGER NOT NULL,
    "evadeChance" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,
    "resistanceId" INTEGER,

    CONSTRAINT "HelmetStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Armor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "statsId" INTEGER NOT NULL,
    "imageUrlsId" INTEGER NOT NULL,

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

    CONSTRAINT "ArmorImageUrls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArmorStats" (
    "id" SERIAL NOT NULL,
    "defence" INTEGER NOT NULL,
    "evadeChance" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,
    "resistanceId" INTEGER,

    CONSTRAINT "ArmorStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Shield" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "imageSrc" TEXT NOT NULL,
    "statsId" INTEGER NOT NULL,

    CONSTRAINT "Shield_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShieldStats" (
    "id" SERIAL NOT NULL,
    "defence" INTEGER NOT NULL,
    "evadeChance" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,
    "resistanceId" INTEGER,

    CONSTRAINT "ShieldStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bow" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "ImageUrlId" INTEGER NOT NULL,
    "statsId" INTEGER NOT NULL,

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

    CONSTRAINT "BowImageUrls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BowStats" (
    "id" SERIAL NOT NULL,
    "damage" TEXT NOT NULL,
    "hitChance" DOUBLE PRECISION,
    "power" DOUBLE PRECISION,
    "criticalChance" DOUBLE PRECISION,
    "criticalMultiplier" DOUBLE PRECISION,
    "counterAttackChance" DOUBLE PRECISION,

    CONSTRAINT "BowStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Resistance" (
    "id" SERIAL NOT NULL,
    "fire" DOUBLE PRECISION,
    "water" DOUBLE PRECISION,
    "earth" DOUBLE PRECISION,
    "wind" DOUBLE PRECISION,
    "light" DOUBLE PRECISION,
    "dark" DOUBLE PRECISION,
    "poison" DOUBLE PRECISION,
    "blood" DOUBLE PRECISION,

    CONSTRAINT "Resistance_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Weapon_name_key" ON "Weapon"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Weapon_statsId_key" ON "Weapon"("statsId");

-- CreateIndex
CREATE UNIQUE INDEX "Helmet_name_key" ON "Helmet"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Helmet_statsId_key" ON "Helmet"("statsId");

-- CreateIndex
CREATE UNIQUE INDEX "HelmetStats_resistanceId_key" ON "HelmetStats"("resistanceId");

-- CreateIndex
CREATE UNIQUE INDEX "Armor_name_key" ON "Armor"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Armor_statsId_key" ON "Armor"("statsId");

-- CreateIndex
CREATE UNIQUE INDEX "Armor_imageUrlsId_key" ON "Armor"("imageUrlsId");

-- CreateIndex
CREATE UNIQUE INDEX "ArmorStats_resistanceId_key" ON "ArmorStats"("resistanceId");

-- CreateIndex
CREATE UNIQUE INDEX "Shield_name_key" ON "Shield"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Shield_statsId_key" ON "Shield"("statsId");

-- CreateIndex
CREATE UNIQUE INDEX "ShieldStats_resistanceId_key" ON "ShieldStats"("resistanceId");

-- CreateIndex
CREATE UNIQUE INDEX "Bow_name_key" ON "Bow"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Bow_ImageUrlId_key" ON "Bow"("ImageUrlId");

-- CreateIndex
CREATE UNIQUE INDEX "Bow_statsId_key" ON "Bow"("statsId");

-- AddForeignKey
ALTER TABLE "Weapon" ADD CONSTRAINT "Weapon_statsId_fkey" FOREIGN KEY ("statsId") REFERENCES "WeaponStats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Helmet" ADD CONSTRAINT "Helmet_statsId_fkey" FOREIGN KEY ("statsId") REFERENCES "HelmetStats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HelmetStats" ADD CONSTRAINT "HelmetStats_resistanceId_fkey" FOREIGN KEY ("resistanceId") REFERENCES "Resistance"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Armor" ADD CONSTRAINT "Armor_statsId_fkey" FOREIGN KEY ("statsId") REFERENCES "ArmorStats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Armor" ADD CONSTRAINT "Armor_imageUrlsId_fkey" FOREIGN KEY ("imageUrlsId") REFERENCES "ArmorImageUrls"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArmorStats" ADD CONSTRAINT "ArmorStats_resistanceId_fkey" FOREIGN KEY ("resistanceId") REFERENCES "Resistance"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Shield" ADD CONSTRAINT "Shield_statsId_fkey" FOREIGN KEY ("statsId") REFERENCES "ShieldStats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShieldStats" ADD CONSTRAINT "ShieldStats_resistanceId_fkey" FOREIGN KEY ("resistanceId") REFERENCES "Resistance"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bow" ADD CONSTRAINT "Bow_ImageUrlId_fkey" FOREIGN KEY ("ImageUrlId") REFERENCES "BowImageUrls"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bow" ADD CONSTRAINT "Bow_statsId_fkey" FOREIGN KEY ("statsId") REFERENCES "BowStats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
