import { Request, Response } from 'express'
import { NextFunction } from 'express';
import { Session, SessionData } from 'express-session';


//saw this onine-> no idea if this is correct
export interface myRequestContext {
    req: Request & { session: Session };
    res: Response;
}


//saw this online -> no idea if this is "correct"
declare module "express-session" {
    interface Session {

      //in this case our userID corresponds to UUID?
      userID: string;
      clientID: string;
    }
  }

function authenticate(req: Request, res: Response, next: NextFunction){
    if(!req.session || !req.session.clientID) {
        const err = new Error('Unauthenticated user.')
        next(err);
      }
      next();
}  

module.exports = authenticate;