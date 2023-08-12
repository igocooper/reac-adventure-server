import { PrismaClient } from '@prisma/client';
import { helmets } from '../../factory/armors';
import { createNestedObjects } from '../../factory/generators/createNestedObjects';

const prisma = new PrismaClient();

async function seed() {
  await prisma.helmetStats.deleteMany({})
  await prisma.helmet.deleteMany({})

  try {
    for (const helmet of helmets) {
      await prisma.helmet.create({
        data: createNestedObjects(helmet),
        include: {
          stats: true
        }
      });
      console.log(`Created weapon with stats: ${helmet.name}`);
    }
  } catch (error) {
    console.error('Error seeding data:', error);
  } finally {
    await prisma.$disconnect();
  }
}

void seed();
