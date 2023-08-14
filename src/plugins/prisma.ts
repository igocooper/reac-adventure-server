import { PrismaClient } from '@prisma/client'
import Hapi from '@hapi/hapi'

// Module augmentation to add shared application state
// https://github.com/DefinitelyTyped/DefinitelyTyped/issues/33809#issuecomment-472103564
declare module '@hapi/hapi' {
  interface ServerApplicationState {
    prisma: PrismaClient
  }
}

// plugin to instantiate Prisma Client
const prismaPlugin: Hapi.Plugin<null> = {
  name: 'prisma',
  register: async function (server: Hapi.Server) {
    server.app.prisma = new PrismaClient();

    server.ext({
      type: 'onPostStop',
      method: async (server) => {
        server.app.prisma.$disconnect();
      }
    })
  },
}

export default prismaPlugin
