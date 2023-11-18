import { Entity, PrimaryGeneratedColumn, Column, OneToMany, JoinColumn} from 'typeorm';
import { Item } from './item.entity'
@Entity({ name: 'user' })
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  email: string;

  @Column()
  password_digest: string;

  
  @OneToMany(type => Item, item => item.user)
  items: Item[];

  // @OneToMany(type => Photo, photo => photo.author) // note: we will create author property in the Photo class below
  // photos: Photo[];
}
