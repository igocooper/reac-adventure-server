import { HELMET_TYPE } from './constants';

export type Resistance = {
  fire?: number;
  water?: number;
  earth?: number;
  wind?: number;
  light?: number;
  dark?: number;
  poison?: number;
  blood?: number;
};

export type ArmorStats = {
  defence: number;
  resistance?: Resistance;
  evadeChance?: number;
  criticalChance?: number;
  counterAttackChance?: number;
};

export type WeaponStats = {
  damage: string;
  hitChance?: number;
  power?: number;
  criticalChance?: number;
  criticalMultiplier?: number;
  counterAttackChance?: number;
};

export type Armor = {
  name: string;
  stats: ArmorStats;
  imageUrls: {
    body: string;
    leftArm: string;
    leftHand: string;
    leftLeg: string;
    rightArm: string;
    rightHand: string;
    rightLeg: string;
  };
};

export type HelmetType = `${HELMET_TYPE}`;

export type Helmet = {
  name: string;
  type: HelmetType;
  large?: boolean;
  imageSrc: string;
  stats: ArmorStats;
};

export type Bow = {
  name: string;
  imageUrls: {
    bowStem: string;
    bowString: string;
    drawnBowString: string;
    quiver: string;
    arrow: string;
  };
  stats: WeaponStats;
};

export type Weapon = {
  name: string;
  imageSrc: string;
  stats: WeaponStats;
};

export type Shield = {
  name: string;
  stats: ArmorStats;
  imageSrc: string;
};
