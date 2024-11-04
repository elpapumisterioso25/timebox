/*
  Warnings:

  - You are about to drop the column `end_time` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `start_time` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `user` table. All the data in the column will be lost.
  - You are about to alter the column `email` on the `user` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(45)`.
  - You are about to alter the column `password` on the `user` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(45)`.
  - Added the required column `nombre` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `user` DROP COLUMN `end_time`,
    DROP COLUMN `name`,
    DROP COLUMN `start_time`,
    DROP COLUMN `status`,
    ADD COLUMN `nombre` VARCHAR(45) NOT NULL,
    MODIFY `email` VARCHAR(45) NOT NULL,
    MODIFY `password` VARCHAR(45) NOT NULL;

-- CreateTable
CREATE TABLE `Task` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(45) NOT NULL,
    `priority` VARCHAR(45) NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Activity` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(45) NOT NULL,
    `start_time` DATETIME(3) NOT NULL,
    `end_time` DATETIME(3) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `taskId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Task` ADD CONSTRAINT `Task_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activity` ADD CONSTRAINT `Activity_taskId_fkey` FOREIGN KEY (`taskId`) REFERENCES `Task`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
