import 'reflect-metadata';
import { createConnection, createConnections, Connection } from 'typeorm';

import express, { Application } from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';

import { Request, Response } from 'express';
import session from 'express-session';
import { connectRedis } from 'connect-redis';
import { createClient } from 'redis';




const main = async () => {
  /*
    Server and Database Initialization
  */
  const port: number = 3000;
  const connection = await createConnection();
  const app: Application = express();

  const RedisStore = connectRedis(session);

  const redisClient = createClient();

  /* Redis Middleware */
  app.use(session({
    store: new RedisStore({client: redisClient}),
    secret: 'mySecret',
    saveUninitialized: false,
    resave: false,
    name: "sessionId",
    cookie: {
      secure: false,
      httpOnly: true,
      maxAge: 1000*60*30 
    }
  }))

  /*
    Necessary Express Middleware
    idrk what this does but we need it
  */
  app.use(express.urlencoded({ extended: true }));
  app.use(express.json());
  app.use(express.json({ type: 'application/vnd.api+json' }));
  app.use(cors());
  
  /*
    Add Routers to the Server
  */
  let usersRouter = require('./routes/user.routes');
  let itemsRouter = require('./routes/item.routes');
  app.use('/users', usersRouter);
  app.use('/items', itemsRouter);

  /*
    Start ther server
  */
  app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
  });
};

/*
  Start main function
*/
main().catch((err) => {
  console.error(err);
});
