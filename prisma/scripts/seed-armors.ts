import { PrismaClient } from '@prisma/client';
import { armors } from '../../factory/armors';
import { createNestedObjects } from '../../factory/generators/createNestedObjects';

const prisma = new PrismaClient();

async function seed() {
  await prisma.armorStats.deleteMany({})
  await prisma.armor.deleteMany({})

  try {
    for (const armor of armors) {
      await prisma.armor.create({
        data: createNestedObjects(armor),
        include: {
          stats: true
        }
      });
      console.log(`Created weapon with stats: ${armor.name}`);
    }
  } catch (error) {
    console.error('Error seeding data:', error);
  } finally {
    await prisma.$disconnect();
  }
}

void seed();
