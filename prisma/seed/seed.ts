import { PrismaService } from '../../src/base/relacional/PrismaService';

const prisma = new PrismaService();



async function main() {
 
}
main()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
