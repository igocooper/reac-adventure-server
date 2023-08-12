type CreateNestedObjects<T> = {
  create: T;
};

type WrapNestedObjects<T> = {
  [K in keyof T]: T[K] extends object ? CreateNestedObjects<T[K]> : T[K];
};

export const createNestedObjects = <T extends object>(
  input: T
): WrapNestedObjects<T> => {
  const result: WrapNestedObjects<T> = {} as WrapNestedObjects<T>;

  for (const key in input) {
    const value = input[key];

    if (typeof value === 'object' && value !== null) {
      result[key] = { create: createNestedObjects(value as any) } as WrapNestedObjects<T>[typeof key];
    } else {
      result[key] = value as WrapNestedObjects<T>[typeof key];
    }
  }

  return result;
};
