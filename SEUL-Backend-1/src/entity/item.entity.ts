import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user.entity'
@Entity({ name: 'item' })
export class Item {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  name: string;

  // @Column({
  //   type: 'bytea',
  //   nullable: true,
  // })
  // image: Buffer;

  @Column({nullable: true})
  description: string;

  @Column({nullable: true})
  price: number;

  // @Column({nullable: true})
  // onSale: boolean;


  @ManyToOne(type => User, user => user.items)
  @JoinColumn({ name: "id" })
  user: User;

  // @ManyToOne(type => Author, author => author.photos)
  // author: Author;

}

/*
  id
  name
  image
  description
  price
  onSale
*/
