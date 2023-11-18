import { getRepository } from 'typeorm';
import { NextFunction, Request, Response, Router } from 'express';
import { Item } from '../entity/item.entity';

/**
 * A repository is an EntityManager;
 * you can manage (insert, update, delete, load, etc.)
 */
const itemRepository = getRepository(Item);


  
/**
 * Create User Rotue
 * @param req
 * @param res
 * @returns
 */
const createItem = async (req: Request, res: Response) => {
  const itemObj = {
    id: '5567380a-242f-4d98-8439-0763a26ea1ef',
    name: 'my degree',
    description: 'Hello',
    price: 3.50
  };

  const newItem: Item = itemRepository.create(itemObj);

  await itemRepository.save(newItem);

  return res.json(itemObj);
};

/**
 * Export Functions
 */
module.exports = {
  createItem,
};
