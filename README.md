# reac-adventure-server

Server part of React adventure game

## Data model

The development of this project is driven by the database schema (also known as the data model).
The schema is first designed to represent the following concepts:

- **User**: represents player and will store data about it's progress.
- **Character**: represent a character with different characteristics.

These are defined in the [Prisma schema](./prisma/schema.prisma).
The database schema will be created by Prisma Migrate.

## Tech Stack

- Backend:
  - PostgreSQL
  - Node.js
  - Prisma
  - TypeScript
  - Jest
  - Hapi.js

## How to use

1. Install npm dependencies:

```
npm install
```

2. Initialise prisma (see ["Prisma Layer"](#prisma-layer))

3. Start server

```
npm run dev
```

## Prisma layer

Make sure [postgres server is running](https://www.notion.so/Postgres-bdf671bc47c74aac98517d6895342856) and `DATABASE_URL` environmental variable is set in `.env` file

Migrate Prisma Scheme

```
npm run migrate:dev
```

Generate Prisma Client

```
prisma:generate
```

Open Prisma Studio to see schema in GUI

```
npx prisma studio
```

## Visualise Prisma Schema

open [prismaliser.app](https://prismaliser.app/) and copy schema from `/prisma/schema.prisma

## Seed database

Seed weapons:

```
npm run seed-weapons
```

Seed bows:

```
npm run seed-bows
```

Seed armors:

```
npm run seed-armors
```

Seed helmets:

```
npm run seed-helmets
```

Seed shields:

```
npm run seed-shields
```
