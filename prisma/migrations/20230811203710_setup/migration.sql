-- CreateTable
CREATE TABLE "Weapon" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "imageSrc" TEXT NOT NULL,

    CONSTRAINT "Weapon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WeaponStats" (
    "id" SERIAL NOT NULL,
    "damage" TEXT NOT NULL,
    "hitChance" INTEGER,
    "power" INTEGER,
    "criticalChance" INTEGER,
    "criticalMultiplier" DOUBLE PRECISION,
    "counterAttackChance" INTEGER,
    "weaponId" INTEGER NOT NULL,

    CONSTRAINT "WeaponStats_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Weapon_name_key" ON "Weapon"("name");

-- CreateIndex
CREATE UNIQUE INDEX "WeaponStats_weaponId_key" ON "WeaponStats"("weaponId");

-- AddForeignKey
ALTER TABLE "WeaponStats" ADD CONSTRAINT "WeaponStats_weaponId_fkey" FOREIGN KEY ("weaponId") REFERENCES "Weapon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
