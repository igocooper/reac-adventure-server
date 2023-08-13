import { PrismaClient } from '@prisma/client';
import { bows } from '../../factory/bows';
import { createNestedObjects } from '../../factory/generators/createNestedObjects';

const prisma = new PrismaClient();

async function seed() {
  await prisma.bow.deleteMany({})
  await prisma.bowStats.deleteMany({})

  try {
    for (const bow of bows) {
      await prisma.bow.create({
        data: createNestedObjects(bow),
        include: {
          stats: true
        }
      });
      console.log(`Created weapon with stats: ${bow.name}`);
    }
  } catch (error) {
    console.error('Error seeding data:', error);
  } finally {
    await prisma.$disconnect();
  }
}

void seed();
