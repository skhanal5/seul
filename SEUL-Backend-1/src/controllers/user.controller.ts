import { getRepository } from 'typeorm';
import { NextFunction, Request, Response, Router } from 'express';
import { User } from '../entity/user.entity';
import * as bcrypt from 'bcrypt';


/**
 * A repository is an EntityManager; 
 * you can manage (insert, update, delete, load, etc.)
 */
const userRepository = getRepository(User);

/**
 * Test Route
 * @param req 
 * @param res 
 * @returns 
 */
const test = (req: Request, res: Response) => {
  return res.send({
    status: 200,
    data: {
      message: 'route works',
    },
  });
};

/**
 * Create User Rotue
 * @param req 
 * @param res 
 * @returns 
 */
const createUser = async (req: Request, res: Response) => {
  const userObj = {
    email: 'bob@gmail.com',
    password_digest: 'hello',
  };

  const newUser: User = userRepository.create(userObj);

  await userRepository.save(newUser);

  return res.json(userObj);
};

/**
 * Register user route
 * @param req
 * @param res
 * @returns
 * 
 */
const registerUser = async(req: Request, res: Response) => {
  try {

    //optimization to check if email and password was sent
    if(!(req.body.email && req.body.password_digest)) {

      //HTTP 400 corresponds to bad syntax
      return res.status(400).send({error: "Missing credentials"})
    }

    const len = `${req.body.email}`.length
    console.log(len)
    
    //generate a 10 digit salt
    const salt = await bcrypt.genSalt(10)
    
    //hash the password w/ salt
    const hashedPW = await bcrypt.hash(`${req.body.password_digest}`, salt);

    //define user object w/ email and hashed password 
    const insertUser = {
      email: req.body.email,
      password_digest: hashedPW
    }

    //call userRepository to create this object
    const insertNewUser: User = userRepository.create(insertUser)
    await userRepository.save(insertNewUser)

    return res.json(insertUser)

    //Go into catch block in case any of the above operations fail
  } catch (error) {

    //remove this if needed.
    console.log(error)

    /* HTTP 500 corresponds to Internal Server error 
      not sure if this is appropriate here. */
    return res.status(500).send("Internal Server Error Occurred.")

  }
}

/**
 * Authenticate route
 * @param Request
 * @param Response
 * @returns
 * 
 */

const authenticateUser = async(req: Request, res: Response) => {
    //look at userRepository to see if we have a user with this email.
    const user = await userRepository.findOne({email: req.body.email});

    //if we do -> check hashed password and plain text password via bcrypt
    if (user) {

      const checkPW = await bcrypt.compare(req.body.password_digest, user.password_digest);
      
      //if valid, prompt valid message and invalid prompts invalid message
      if (checkPW) {
        req.session.userID = user.id;
        return res.status(200).json({message: "Valid Password. Securely logging you in."})
      } else {

        //HTTP 400 corresponds to bad syntax from client
        return res.status(400).json({error: "Invalid password. Try again"})
      }
    } else {

      /* HTTP 401 corresponds to being unauthorized. Maybe this could be changed  
        400 if that is more appropriate */
      return res.status(401).json({error: "Email address is invalid."})
    }
}

/**
 * Export Functions
 */
module.exports = {
  test,
  createUser,
  registerUser,
  authenticateUser
};
