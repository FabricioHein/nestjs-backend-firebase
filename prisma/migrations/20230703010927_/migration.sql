-- AlterTable
ALTER TABLE "campanha_mkt" ADD COLUMN     "data_final" TIMESTAMP(3),
ADD COLUMN     "data_inicial" TIMESTAMP(3),
ADD COLUMN     "status" VARCHAR(10);

-- AlterTable
ALTER TABLE "email" ADD COLUMN     "campanha_mktId" INTEGER;

-- AlterTable
ALTER TABLE "sms" ADD COLUMN     "campanha_mktId" INTEGER;

-- AddForeignKey
ALTER TABLE "email" ADD CONSTRAINT "email_campanha_mktId_fkey" FOREIGN KEY ("campanha_mktId") REFERENCES "campanha_mkt"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sms" ADD CONSTRAINT "sms_campanha_mktId_fkey" FOREIGN KEY ("campanha_mktId") REFERENCES "campanha_mkt"("id") ON DELETE SET NULL ON UPDATE CASCADE;
