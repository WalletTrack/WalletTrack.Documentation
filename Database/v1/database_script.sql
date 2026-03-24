CREATE TABLE `User`(
    `Id` CHAR(36) NOT NULL,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Username` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `BirthDate` DATE NOT NULL,
    `PasswordHash` BINARY(16) NOT NULL,
    `PasswordSalt` BINARY(16) NOT NULL,
    `Gender` ENUM('') NOT NULL,
    `IsDeleted` BOOLEAN NOT NULL,
    PRIMARY KEY(`Id`)
);
CREATE TABLE `Transaction`(
    `Id` CHAR(36) NOT NULL,
    `Description` VARCHAR(255) NOT NULL,
    `Amount` FLOAT(53) NOT NULL,
    `Date` DATE NOT NULL,
    `Type` ENUM('') NOT NULL,
    `CategoryId` CHAR(36) NOT NULL,
    `BudgetId` CHAR(36) NOT NULL,
    `UserId` CHAR(36) NOT NULL,
    `IsDeleted` BOOLEAN NOT NULL,
    PRIMARY KEY(`Id`)
);
CREATE TABLE `Category`(
    `Id` CHAR(36) NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Description` VARCHAR(255) NOT NULL,
    `Type` ENUM('') NOT NULL,
    `IsDeleted` BOOLEAN NOT NULL,
    PRIMARY KEY(`Id`)
);
CREATE TABLE `Buget`(
    `Id` CHAR(36) NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Month` ENUM('') NULL,
    `Year` BIGINT NOT NULL,
    `UserId` CHAR(36) NOT NULL,
    `IsFinished` BOOLEAN NOT NULL,
    `IsDeleted` BOOLEAN NOT NULL,
    PRIMARY KEY(`Id`)
);
ALTER TABLE
    `Buget` ADD CONSTRAINT `buget_userid_foreign` FOREIGN KEY(`UserId`) REFERENCES `User`(`Id`);
ALTER TABLE
    `Transaction` ADD CONSTRAINT `transaction_userid_foreign` FOREIGN KEY(`UserId`) REFERENCES `User`(`Id`);
ALTER TABLE
    `Transaction` ADD CONSTRAINT `transaction_categoryid_foreign` FOREIGN KEY(`CategoryId`) REFERENCES `Category`(`Id`);
ALTER TABLE
    `Transaction` ADD CONSTRAINT `transaction_budgetid_foreign` FOREIGN KEY(`BudgetId`) REFERENCES `Buget`(`Id`);