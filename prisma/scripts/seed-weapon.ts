import { PrismaClient } from '@prisma/client';
import { weapons } from '../../factory/weapons';
import { createNestedObjects } from '../../factory/generators/createNestedObjects';

const prisma = new PrismaClient();

async function seed() {
  await prisma.weapon.deleteMany({})
  await prisma.weaponStats.deleteMany({})

  try {
    for (const weapon of weapons) {
      await prisma.weapon.create({
        data: createNestedObjects(weapon),
        include: {
          stats: true
        }
      });
      console.log(`Created weapon with stats: ${weapon.name}`);
    }
  } catch (error) {
    console.error('Error seeding data:', error);
  } finally {
    await prisma.$disconnect();
  }
}

void seed();
