import Hapi from '@hapi/hapi';
import dotenv from 'dotenv';
import hapiPino from 'hapi-pino';
import statusPlugin from './plugin/status';
import prismaPlugin from './plugin/prisma';
import weaponsPlugin from './plugin/weapons';

dotenv.config();

const server: Hapi.Server = Hapi.server({
  port: process.env.PORT || 3000,
  host: process.env.HOST || '0.0.0.0'
});

export async function createServer(): Promise<Hapi.Server> {
  // Register the logger
  await server.register({
    plugin: hapiPino,
    options: {
      logEvents:
        process.env.CI === 'true' || process.env.TEST === 'true'
          ? false
          : undefined,
      prettyPrint: process.env.NODE_ENV !== 'production',
      // Redact Authorization headers, see https://getpino.io/#/docs/redaction
      redact: ['req.headers.authorization']
    }
  });

  await server.register([statusPlugin, prismaPlugin, weaponsPlugin]);

  await server.initialize();

  return server;
}

export async function startServer(server: Hapi.Server): Promise<Hapi.Server> {
  await server.start();
  server.log('info', `Server running on ${server.info.uri}`);
  return server;
}

process.on('unhandledRejection', (err) => {
  console.log(err);
  process.exit(1);
});
